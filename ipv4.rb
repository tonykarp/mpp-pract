def ipv4_address?(address)
  parts = address.split('.')

  return false unless parts.length == 4

  parts.all? do |part|
    # Перевіряємо, чи є це число в межах від 0 до 255 та без ведучих нулів
    part.match?(/^\d{1,3}$/) && part.to_i >= 0 && part.to_i <= 255 && (part.to_i.to_s == part)
  end
end

puts ipv4_address?('192.168.0.1')   # true
puts ipv4_address?('256.1.1.1')     # false (число більше 255)
puts ipv4_address?('1.2.3.4')      # false (ведучий нуль)
puts ipv4_address?('192.168.0.01')  # false (ведучий нуль)
