require_relative '../models/user'
require_relative '../models/retirement_income'
require_relative '../models/income_sources'
require 'rspec'

describe IncomeSources do

  before :each do
    ss1_income = RetirementIncome.new(type: 'SS1',
                                      start_age: 60,
                                      annual_amount: 24000)
    ss2_income = RetirementIncome.new(type: 'SS2',
                                      start_age: 65,
                                      annual_amount: 10000)
    pension1_income = RetirementIncome.new(type: 'PENSION1',
                                           start_age: 60,
                                           annual_amount: 15000)
    pension2_income = RetirementIncome.new(type: 'PENSION2',
                                           start_age: 63,
                                           annual_amount: 3000)
    ptw1_income = RetirementIncome.new(type: 'PTWORK1',
                                       start_age: 59,
                                       annual_amount: 14000)
    ptw2_income = RetirementIncome.new(type: 'PTWORK2',
                                       start_age: 61,
                                       annual_amount: 9000)
    @user = User.new(current_age: 30, retirement_age: 60)
    @retirement_income = [ss1_income, ss2_income, pension1_income, pension2_income,
                          ptw1_income, ptw2_income]
    @income_sources = IncomeSources.new(user: @user,
                                         retirement_income: @retirement_income)
  end

  it 'determines how much a user will collect in social security 1 when they retire' do
    expect(@income_sources.crunch_numbers('SS1')).to eq 50341.62
  end

  it 'determines how much a user will collect in social security 2 when they retire' do
    expect(@income_sources.crunch_numbers('SS2')).to eq 23732.05
  end

  it 'determines how much a user will collect in pension 1 when they retire' do
    expect(@income_sources.crunch_numbers('PENSION1')).to eq 31463.51
  end

  it 'determines how much a user will collect in pension 2 when they retire' do
    expect(@income_sources.crunch_numbers('PENSION2')).to eq 6776.55
  end

  it 'determines how much a user will collect in PT Work 1 when they retire' do
    expect(@income_sources.crunch_numbers('PTWORK1')).to eq 28649.70
  end

  it 'determines how much a user will collect in PT Work 1 when they retire' do
    expect(@income_sources.crunch_numbers('PTWORK2')).to eq 19350.06
  end

  it 'sums together all of the income sources for a given age' do
    expect(@income_sources.total_income_sources(60)).to eq 111171.08
  end
end
