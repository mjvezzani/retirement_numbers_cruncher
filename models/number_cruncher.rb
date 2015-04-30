class NumberCruncher

  attr_reader :user, :retirement_income

  def initialize(args)
    @user = args[:user]
    @retirement_income = args[:retirement_income]
  end

  def crunch_ss1_numbers
    income_to_crunch = retirement_income.select{|x| x.type == 'SS1'}
    time_passed = income_to_crunch[0].start_age - user.current_age
    amount_dispersed = income_to_crunch[0].annual_amount
    time_passed.times do
      amount_dispersed *= 1.025
    end
    amount_dispersed.round(2)
  end

  def crunch_ss2_numbers
    income_to_crunch = retirement_income.select{|x| x.type == 'SS2'}
    time_passed = income_to_crunch[0].start_age - user.current_age
    amount_dispersed = income_to_crunch[0].annual_amount
    time_passed.times do
      amount_dispersed *= 1.025
    end
    amount_dispersed.round(2)
  end

  def crunch_pension1_numbers
    income_to_crunch = retirement_income.select{|x| x.type == 'PENSION1'}
    time_passed = income_to_crunch[0].start_age - user.current_age
    amount_dispersed = income_to_crunch[0].annual_amount
    time_passed.times do
      amount_dispersed *= 1.025
    end
    amount_dispersed.round(2)
  end

  def crunch_pension2_numbers
    income_to_crunch = retirement_income.select{|x| x.type == 'PENSION2'}
    time_passed = income_to_crunch[0].start_age - user.current_age
    amount_dispersed = income_to_crunch[0].annual_amount
    time_passed.times do
      amount_dispersed *= 1.025
    end
    amount_dispersed.round(2)
  end

  def crunch_pension2_numbers
    income_to_crunch = retirement_income.select{|x| x.type == 'PENSION2'}
    time_passed = income_to_crunch[0].start_age - user.current_age
    amount_dispersed = income_to_crunch[0].annual_amount
    time_passed.times do
      amount_dispersed *= 1.025
    end
    amount_dispersed.round(2)
  end

  def crunch_ptw1_numbers
    income_to_crunch = retirement_income.select{|x| x.type == 'PTWORK1'}
    time_passed = income_to_crunch[0].start_age - user.current_age
    amount_dispersed = income_to_crunch[0].annual_amount
    time_passed.times do
      amount_dispersed *= 1.025
    end
    amount_dispersed.round(2)
  end

  def crunch_ptw2_numbers
    income_to_crunch = retirement_income.select{|x| x.type == 'PTWORK2'}
    time_passed = income_to_crunch[0].start_age - user.current_age
    amount_dispersed = income_to_crunch[0].annual_amount
    time_passed.times do
      amount_dispersed *= 1.025
    end
    amount_dispersed.round(2)
  end

  def total_income_sources(age)
    time_passed = age - user.current_age
    total_amount = 0
    qualified_income = retirement_income.select{|x| x.start_age <= age}
    qualified_income.each{|x| total_amount += x.annual_amount}
    time_passed.times do
      total_amount *= 1.025
    end
    total_amount.round(2)
  end

end
