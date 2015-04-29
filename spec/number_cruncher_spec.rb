require_relative '../models/user'
require_relative '../models/retirement_income'
require_relative '../models/number_cruncher'
require 'rspec'

describe NumberCruncher do

  it 'determines how much a user will collect in social security when they retire' do
    user = User.new(current_age: 30, retirement_age: 60)
    retirement_income = RetirementIncome.new(type: 'ss1',
                                             start_age: 60,
                                             annual_amount: 24000)
    number_cruncher = NumberCruncher.new(user: user,
                                         retirement_income: retirement_income)

    expect(number_cruncher.crunch_ss_numbers).to eq 50341.62
  end

  it 'determines how much a user will collect in social security 2 when they retire' do
    user = User.new(current_age: 30, retirement_age: 60)
    retirement_income = RetirementIncome.new(type: 'ss2',
                                             start_age: 65,
                                             annual_amount: 10000)
    number_cruncher = NumberCruncher.new(user: user,
                                         retirement_income: retirement_income)

    expect(number_cruncher.crunch_ss_numbers).to eq 23732.05
  end

end
