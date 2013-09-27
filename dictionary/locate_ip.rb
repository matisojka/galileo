require 'csv'

class LocateIp

  attr_reader :ip

  def initialize(ip)
    @ip = IP.new(ip).to_integer
  end

  def country
    self.class.ip_country.each do |row|
      start_ip = row[0].to_i
      end_ip = row[1].to_i

      return row[4] if (start_ip..end_ip).cover?(ip)
    end
  end

  private

  # Save the variable on the class so the CSV is only going to
  # get parsed once
  def self.ip_country
    @ip_country ||= CSV.read('./dictionary/ip_to_country.csv')
  end

end

