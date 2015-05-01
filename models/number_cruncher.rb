class NumberCruncher

  attr_reader :user, :retirement_income

  def initialize(args)
    @user = args[:user]
    @retirement_income = args[:retirement_income]
  end

  def run_the_numbers(what_to_crunch)
    time_passed = what_to_crunch[0].start_age - user.current_age
    amount_dispersed = what_to_crunch[0].annual_amount
    time_passed.times{ amount_dispersed *= 1.025 }
    amount_dispersed.round(2)
  end

  def crunch_ss1_numbers
    run_the_numbers(retirement_income.select{|x| x.type == 'SS1'})
  end

  def crunch_ss2_numbers
    run_the_numbers(retirement_income.select{|x| x.type == 'SS2'})
  end

  def crunch_pension1_numbers
    run_the_numbers(retirement_income.select{|x| x.type == 'PENSION1'})
  end

  def crunch_pension2_numbers
    run_the_numbers(retirement_income.select{|x| x.type == 'PENSION2'})
  end

  def crunch_pension2_numbers
    run_the_numbers(retirement_income.select{|x| x.type == 'PENSION2'})
  end

  def crunch_ptw1_numbers
    run_the_numbers(retirement_income.select{|x| x.type == 'PTWORK1'})
  end

  def crunch_ptw2_numbers
    run_the_numbers(retirement_income.select{|x| x.type == 'PTWORK2'})
  end

  def total_income_sources(age)
    total_amount = 0
    qualified_income = retirement_income.select{|x| x.start_age <= age}
    qualified_income.each{|x| total_amount += x.annual_amount}
    (age - user.current_age).times do
      total_amount *= 1.025
    end
    total_amount.round(2)
  end

end
