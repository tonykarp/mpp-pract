def roman_to_arabic(roman)
  roman_numerals = {
    'I' => 1,
    'V' => 5,
    'X' => 10,
    'L' => 50,
    'C' => 100,
    'D' => 500,
    'M' => 1000
  }

  arabic = 0
  prev_value = 0

  roman.reverse.each_char do |char|
    value = roman_numerals[char]

    if !value
      puts "Невірний символ у римському числі: #{char}"
      return
    end

    if value < prev_value
      arabic -= value
    else
      arabic += value
    end

    prev_value = value
  end

  arabic
end

def arabic_to_roman(arabic)
  roman_numerals = {
    1000 => 'M',
    900 => 'CM',
    500 => 'D',
    400 => 'CD',
    100 => 'C',
    90 => 'XC',
    50 => 'L',
    40 => 'XL',
    10 => 'X',
    9 => 'IX',
    5 => 'V',
    4 => 'IV',
    1 => 'I'
  }

  roman = ''

  roman_numerals.each do |value, numeral|
    while arabic >= value
      roman += numeral
      arabic -= value
    end
  end

  roman
end

# Ввід числа з терміналу
print 'Введіть римське або арабське число: '
user_input = gets.chomp

# Визначення формату числа (римське чи арабське) та виведення результату
if user_input.match?(/^\d+$/)
  arabic_number = user_input.to_i
  puts "#{arabic_number} у римських числах: #{arabic_to_roman(arabic_number)}"
elsif user_input.match?(/^[IVXLCDM]+$/i)
  roman_number = user_input.upcase
  puts "#{roman_number} у арабських числах: #{roman_to_arabic(roman_number)}"
else
  puts "Невідомий формат числа: #{user_input}"
end
