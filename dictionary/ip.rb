class IP

  attr_reader :ip

  def initialize(ip)
    @ip = ip
  end

  def to_integer
    first + second + third + fourth
  end

  private

  def split_ip
    @split_ip ||= ip.split('.').map(&:to_i)
  end

  def first
    split_ip[0] * (256 ** 3)
  end

  def second
    split_ip[1] * (256 ** 2)
  end

  def third
    split_ip[2] * 256
  end

  def fourth
    split_ip[3]
  end

end

