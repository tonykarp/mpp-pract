def infix_to_rpn(expression)
  precedence = { '+' => 1, '-' => 1, '*' => 2, '/' => 2 }
  output = []
  operators = []

  expression.split.each do |token|
    if token.match?(/\d+/)
      output << token
    elsif token.match?(/[\+\-\*\/]/)
      while operators.any? && precedence[operators.last] >= precedence[token]
        output << operators.pop
      end
      operators << token
    elsif token == '('
      operators << token
    elsif token == ')'
      output << operators.pop while operators.any? && operators.last != '('
      operators.pop if operators.any? && operators.last == '('
    end
  end

  output.concat(operators.reverse)
  output.join(' ')
end

# Data enter
expression = "5 - 1 * 8 + 3"
rpn = infix_to_rpn(expression)
puts "Infix: #{expression}"
puts "RPN: #{rpn}"
