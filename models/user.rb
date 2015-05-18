class User

  attr_accessor :current_age, :retirement_age,
                :nest_egg,
                :pre_retirement_risk,
                :post_retirement_risk,
                :nest_egg_100,
                :savings_rate

  def initialize(args)
    @current_age = args[:current_age]
    @retirement_age = args[:retirement_age]
    @nest_egg = args[:nest_egg]
    @pre_retirement_risk = args[:pre_retirement_risk]
    @post_retirement_risk = args[:post_retirement_risk]
    @nest_egg_100 = args[:nest_egg_100]
    @savings_rate = args[:savings_rate]
  end

end
