class IncomeSources

  attr_reader :user, :retirement_income

  def initialize(args)
    @user = args[:user]
    @retirement_income = args[:retirement_income]
  end

  def run_the_numbers(what_to_crunch)
    time_passed = what_to_crunch.start_age - user.current_age
    amount_dispersed = what_to_crunch.annual_amount
    time_passed.times{ amount_dispersed *= 1.025 }
    amount_dispersed.round(2)
  end

  def crunch_numbers(type)
    run_the_numbers(retirement_income.select{|x| x.type == type}.pop)
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
