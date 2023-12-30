require 'yaml'
MESSAGES = YAML.load_file('loan_calc_msgs.yml')

LANGUAGES = {
  English: 'En',
  French: 'Fr',
  Spanish: 'Es',
  German: 'De',
  Japanese: 'Ni'
}

LANG_CONSENT = {
  'En' => 'y',
  'Fr' => 'o',
  'Es' => 's',
  'De' => 'j',
  'Ni' => 'y'
}

input                   = nil
loan_amount             = nil
loan_duration           = nil
measure_in_months       = nil
apr                     = nil

language_select = <<-HERE
1)  English
2)  Française
3)  Española
4)  Deutsch
5)  日本語
HERE

def calc_monthly_payment(loan_amount, loan_duration, apr,
                         measure_in_months: false)
  monthly_interest = (apr / 100) / 12
  if measure_in_months
    loan_duration_in_months = loan_duration
  else
    loan_duration_in_months = loan_duration * 12
  end
  amortization_factor = (monthly_interest /
                        (1 - ((1 + monthly_interest)**
                        (-loan_duration_in_months))))
  (loan_amount * amortization_factor).round(2)
end

def valid_float?(number)
  number.to_f.to_s == number && number.to_f >= 0
end

def valid_integer?(number)
  number.to_i.to_s == number && number.to_i > 0
end

def prompt(message)
  puts("=> #{message}")
end

def input_to_language(string)
  choices = {
    '1' => 'En',
    '2' => 'Fr',
    '3' => 'Es',
    '4' => 'De',
    '5' => 'Ni'
  }
  choices[string]
end

def select_language
  loop do
    input = gets.chomp
    return input_to_language(input) if %w(1 2 3 4 5).include?(input)
  end
end

def get_loan_total
  loop do
    input = gets.chomp
    return input.to_i if valid_integer?(input)
    prompt(MESSAGES[LANG_PREF]['invalid_number'])
  end
end

def get_loan_duration_unit
  prompt(MESSAGES[LANG_PREF]['get_unit'])
  input = gets.chomp.downcase
  LANG_CONSENT[LANG_PREF] == input
end

def get_loan_duration(measure_in_months)
  loop do
    if measure_in_months
      prompt(MESSAGES[LANG_PREF]['measured_months'])
    else
      prompt(MESSAGES[LANG_PREF]['measured_years'])
    end
    input = gets.chomp
    return input.to_i if valid_integer?(input)
    prompt(MESSAGES[LANG_PREF]['invalid_number'])
  end
end

def get_apr
  loop do
    prompt(MESSAGES[LANG_PREF]['get_apr'])
    input = gets.chomp
    return input.to_f if valid_float?(input) || valid_integer?(input)
    prompt(MESSAGES[LANG_PREF]['invalid_number'])
  end
end

puts language_select
LANG_PREF = select_language()
prompt(MESSAGES[LANG_PREF]['greeting'])

loop do # Main loop
  prompt(MESSAGES[LANG_PREF]['total_loan_amount'])
  loan_amount = get_loan_total
  measure_in_months = get_loan_duration_unit
  loan_duration = get_loan_duration(measure_in_months)
  apr = get_apr
  prompt(MESSAGES[LANG_PREF]['calculating'])
  monthly_payments = calc_monthly_payment(loan_amount,
                                          loan_duration,
                                          apr,
                                          measure_in_months: measure_in_months)
  prompt(format(MESSAGES[LANG_PREF]['result'], monthly_payments))
  prompt(MESSAGES[LANG_PREF]['calc_again'])
  input = gets.chomp.downcase
  next if LANG_CONSENT[LANG_PREF] == input
  break
end
