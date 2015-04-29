class NumberCruncher

  attr_reader :user, :retirement_income

  def initialize(args)
    @user = args[:user]
    @retirement_income = args[:retirement_income]
  end

  def crunch_ss_numbers
    time_passed = retirement_income.start_age - user.current_age
    amount_dispersed = retirement_income.annual_amount
    time_passed.times do
      amount_dispersed *= 1.025
    end
    amount_dispersed.round(2)
  end

end
