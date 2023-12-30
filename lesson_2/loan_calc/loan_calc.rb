require 'yaml'

def calc_monthly_payment(loan_amount, loan_duration, apr,
                         measure_in_months: false)
  monthly_interest = (apr / 100) / 12
  if measure_in_months
    loan_duration_in_months = loan_duration
  else
    loan_duration_in_months = loan_duration * 12
  end
  amortization_factor = (monthly_interest / (1 - ((1 + monthly_interest)**(-loan_duration_in_months))))
  (loan_amount * amortization_factor).round(2)
end

def valid_number?(integer)
  (integer.to_i.to_s == integer || integer.to_f.to_s == integer) && integer.to_i > 0
end

def prompt(message)
  puts("=> #{message}")
end

def input_to_language(string)
  case string
  when '1'
    'En'
  when '2'
    'Fr'
  when '3'
    'Es'
  when '4'
    'De'
  when '5'
    'Ni'
  else
    prompt("Input not recognized. Defaulting to English.")
    'En'
  end
end

LANGUAGES = {
  English: 'En',
  French: 'Fr',
  Spanish: 'Es',
  German: 'De',
  Japanese: 'Ni'
}

lang_pref               = ''
input                   = nil
loan_amount             = nil
loan_duration           = nil
measure_in_months = nil
apr = nil

MESSAGES = YAML.load_file('loan_calc_msgs.yml')

language_select = <<-HERE
1)  English
2)  Française
3)  Española
4)  Deutsch
5)  日本語
HERE

loop do
  puts language_select
  input = gets.chomp
  if %w(1 2 3 4 5).include?(input)
    lang_pref = input_to_language(input)
    prompt(MESSAGES[lang_pref]['greeting'])
    break
  end
end

loop do # Main loop
  loop do # Get loan total
    prompt(MESSAGES[lang_pref]['total_loan_amount'])
    input = gets.chomp
    if valid_number?(input)
      loan_amount = input.to_i
      break
    else
      prompt(MESSAGES[lang_pref]['invalid_number'])
    end
  end

  # Get loan duration unit
  prompt(MESSAGES[lang_pref]['get_unit'])
  input = gets.chomp.downcase
  # 'yosj' are the different choices that stand for yes in the different
  if 'yosj'.include?(input)
    measure_in_months = true
  end

  loop do # Get loan duration
    if measure_in_months
      prompt(MESSAGES[lang_pref]['measured_months'])
    else
      prompt(MESSAGES[lang_pref]['measured_years'])
    end
    input = gets.chomp
    if valid_number?(input)
      loan_duration = input.to_i
      break
    else
      prompt(MESSAGES[lang_pref]['invalid_number'])
    end
  end

  loop do # Get APR
    prompt(MESSAGES[lang_pref]['get_apr'])
    input = gets.chomp
    if valid_number?(input)
      apr = input.to_f
      break
    else
      prompt(MESSAGES[lang_pref]['invalid_number'])
    end
  end

  prompt(MESSAGES[lang_pref]['calculating'])
  monthly_payments = calc_monthly_payment(loan_amount, loan_duration, apr,
                                          measure_in_months: measure_in_months)
  prompt(format(MESSAGES[lang_pref]['result'], monthly_payments))

  prompt(MESSAGES[lang_pref]['calc_again'])
  input = gets.chomp.downcase
  unless 'yosj'.include?(input)
    break
  end
end
