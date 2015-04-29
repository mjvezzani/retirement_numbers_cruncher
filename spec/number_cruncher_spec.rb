require_relative '../models/user'
require_relative '../models/retirement_income'
require_relative '../models/number_cruncher'
require 'rspec'

describe NumberCruncher do

  before :each do
    @user = User.new(current_age: 30, retirement_age: 60)
    @retirement_income = RetirementIncome.new(type: 'ss1',
                                             start_age: 60,
                                             annual_amount: 24000)
    @number_cruncher = NumberCruncher.new(user: @user,
                                         retirement_income: @retirement_income)
  end

  it 'determines how much a user will collect in social security 1 when they retire' do
    expect(@number_cruncher.crunch_numbers).to eq 50341.62
  end

  it 'determines how much a user will collect in social security 2 when they retire' do
    @retirement_income.start_age = 65
    @retirement_income.annual_amount = 10000

    expect(@number_cruncher.crunch_numbers).to eq 23732.05
  end

  it 'determines how much a user will collect in pension 1 when they retire' do
    @retirement_income.type = 'pension1'
    @retirement_income.start_age = 60
    @retirement_income.annual_amount = 15000

    expect(@number_cruncher.crunch_numbers).to eq 31463.51
  end

  it 'determines how much a user will collect in pension 2 when they retire' do
    @retirement_income.type = 'pension2'
    @retirement_income.start_age = 63
    @retirement_income.annual_amount = 3000

    expect(@number_cruncher.crunch_numbers).to eq 6776.55
  end

  it 'determines how much a user will collect in PT Work 1 when they retire' do
    @retirement_income.type = 'ptw1'
    @retirement_income.start_age = 59
    @retirement_income.annual_amount = 14000

    expect(@number_cruncher.crunch_numbers).to eq 28649.70
  end

  it 'determines how much a user will collect in PT Work 1 when they retire' do
    @retirement_income.type = 'ptw2'
    @retirement_income.start_age = 61
    @retirement_income.annual_amount = 9000 

    expect(@number_cruncher.crunch_numbers).to eq 19350.06
  end

end
