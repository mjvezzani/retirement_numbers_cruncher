class User

  attr_accessor :current_age, :target_retirement_age,
                :desired_retirement_amount_basic,
                :desired_retirement_amount_fun,
                :bucket_list_funding,
                :current_nest_egg,
                :pre_retirement_risk,
                :post_retirement_rist,
                :minimum_nest_egg_100,
                :annual_savings_rate

  def initialize(args)
    @current_age = args[:current_age]
    @target_retirement_age = args[:retirement_age]
    @desired_retirement_amount_basic = args[:retirement_amount_basic]
    @desired_retirement_amount_fun = args[:retirement_amount_fun]
    @bucket_list_funding = args[:bucket_list_funding]
    @current_nest_egg = args[:nest_egg]
    @pre_retirement_risk = args[:pre_retirement_risk]
    @post_retirement_risk = args[:post_retirement_risk]
    @minimum_nest_egg_100 = args[:nest_egg_100]
    @annual_savings_rate = args[:savings_rate]
  end

end
