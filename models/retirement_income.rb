class RetirementIncome

  attr_accessor :type, :start_age, :end_age, :annual_amount

  def initialize(args)
    @type = args[:type]
    @start_age = args[:start_age]
    @end_age = args[:end_age]
    @annual_amount = args[:annual_amount]
  end

end
