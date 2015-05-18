require 'rspec'
require_relative '../models/user.rb'

describe User do

  before :each do
    @user = User.new(current_age: 30,
                     retirement_age: 60,
                     nest_egg: 33000,
                     pre_retirement_risk: 'aggressive',
                     post_retirement_risk: 'ultra-cons',
                     nest_egg_100: 200000,
                     savings_rate: '8%')
  end

  it 'has a current age' do
    expect(@user.current_age).to eq 30
  end
  it 'has a target retirement age' do
    expect(@user.retirement_age).to eq 60
  end
  it 'has income needs'

  it 'has a current nest egg' do
    expect(@user.nest_egg).to eq 33000
  end
  it 'has pre retirement risk preferences' do
    expect(@user.pre_retirement_risk).to eq 'aggressive'
  end
  it 'has post retirement risk preferences' do
    expect(@user.post_retirement_risk).to eq 'ultra-cons'
  end
  it 'has a minimum nest egg at age 100' do
    expect(@user.nest_egg_100).to eq 200000
  end
  it 'has a annual savings rate' do
    expect(@user.savings_rate).to eq '8%'
  end
end
