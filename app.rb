require 'rubygems'
require 'bundler'

Bundler.require :default, (ENV['RACK_ENV'] || 'development').to_sym

require './dictionary/ip'
require './dictionary/locate_ip'

helpers do
  def ip_regex
    %r(^(?:[0-9]{1,3}\.){3}[0-9]{1,3}$)
  end
end

configure do
  ENV['MEMCACHED_SERVERS'] ||= ENV['MEMCACHIER_SERVERS']
  ENV['MEMCACHED_USERNAME'] ||= ENV['MEMCACHIER_USERNAME']
  ENV['MEMCACHED_PASSWORD'] ||= ENV['MEMCACHIER_PASSWORD']
  set :cache, Dalli::Client.new
end

get '/' do
  "Sample usage: /ips/#{request.ip}"
end

get '/ips/:ip' do
  cache_control :public, max_age: 31536000
  content_type :json

  ip = params[:ip]
  etag ip

  if ip =~ ip_regex
    country = settings.cache.fetch(ip) do
      country_code = LocateIp.new(ip).country
      settings.cache.set(ip, country_code)

      country_code
    end

    {
      ip: params[:ip],
      country: country
    }.to_json
  else
    response.status = 400
  end

end

