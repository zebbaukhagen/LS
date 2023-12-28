require 'yaml'

def prompt(message)
  puts("=> #{message}")
end

def valid_number?(num)
integer?(num) || float?(num)
end

def integer?(num)
  num.to_i.to_s == num
end

def float?(num)
  num.to_f.to_s == num
end

MESSAGES = YAML.load_file('calculator_messages.yml')

OPERATIONS = {
  '1' => 'Adding',
  '2' => 'Subtracting',
  '3' => 'Multiplying',
  '4' => 'Dividing'
}

prompt(MESSAGES['welcome'])

name = ''
loop do
  name = gets.chomp
  if name.empty?
    prompt(MESSAGES['valid_name'])
  else
    break
  end
end

prompt(sprintf(MESSAGES['hello'], name))

loop do # main loop
  number1 = nil
  number2 = nil

  loop do
    prompt("What's the first number?")
    number1 = gets.chomp

    if valid_number?(number1)
      break
    else
      prompt("Hmm, that doesn't look like a valid number.")
    end
  end

  loop do
    prompt("What's the second number?")
    number2 = gets.chomp
    if valid_number?(number2)
      break
    else
      prompt("Hmm, that doesn't look like a valid number.")
    end
  end

  operator_prompt = <<-MSG
  What operation would you like to perform?
  1) add
  2) subtract
  3) multiply
  4) divide
  MSG
  prompt(operator_prompt)

  operator = ''
  loop do
    operator = gets.chomp

    if %w(1 2 3 4).include?(operator)
      break
    else
      prompt("Must choose 1, 2, 3 or 4")
    end
  end

  prompt("#{OPERATIONS[operator]} the two numbers...")

  result =  case operator
            when '1'
              number1.to_i + number2.to_i
            when '2'
              number1.to_i - number2.to_i
            when '3'
              number1.to_i * number2.to_i
            when '4'
              number1.to_f / number2.to_f
            end

  prompt("The result is #{result}")

  prompt("Would you like to perform another calculation? (Y/N)")
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

prompt("Thank you for using calculator!")
