def calculate_monthly_payment(loan_amount, loan_duration_in_years, apr)
  monthly_interest = (apr.to_f / 100) / 12
  loan_duration_in_months = loan_duration_in_years * 12
  amortization_factor = (monthly_interest / (1 - (1 + monthly_interest)**(-loan_duration_in_months)))
  (loan_amount * amortization_factor).round(2)
end

LANGUAGES = {
  English:  'English',
  French:   'Française',
  Spanish:  'Española',
  German:   'Deutsch',
  Japanese: '日本語' # Nihongo
}

user_name     = ''
language_pref = ''


=begin
START

Select language
Get user name
Greet user

WHILE user_consenting

  LOOP
    GET total loan amount & validate
  end

  LOOP
    GET APR & validate
  end

  LOOP
  GET loan duration & validate
  end

  SET monthly interest rate
  SET loan duration in months
  SET monthly payment

  RETURN "For a loan of ${} at {}% APR, the monthly payment will be ${}."
end

END
=end
