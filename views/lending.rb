# frozen_string_literal: true

module Lending
  # For the elements I use the structure of {access_type}_{type}__{name_element}
  @@id_txt_monthly_income = 'ingresosMensuales'
  @@xp_drp_years = '//select[@ng-model="termInYears"]'
  @@xp_drp_years_quota = '//select[@ng-model="termInYearsByQuota"]'
  @@xp_btn_credit_calculate = '//h4[contains(.,"Calcular Crédito")]'
  @@xp_txt_result = '//dd[contains(.,"$")]'
  @@xp_txt_result_fees = '(//dd[contains(@class,"ng-binding")])[5]'
  @@xp_txt_higher = '//p[contains(@class,"validacion ng-binding")]'
  @@xp_txt_lower = '//p[@class="validacion"]'

  def insert_money(money)
    $money = money
    wait_displays(:id, @@id_txt_monthly_income, 1)
    enter_text(:id, $money, @@id_txt_monthly_income)
  end

  # This method is used to define the element to be used for both the "Calculate how much they lend you" functionality and the "Calculate the value of the installments"
  def insert_years(years, from)
    $from = from
    element = select_element(from)
    wait_displays(:xpath, element, 1)
    select_option_from_dropdown(:xpath, :text, years, element)
  end

  def simulation
    wait_displays(:xpath, @@xp_btn_credit_calculate, 1)
    click(:xpath, @@xp_btn_credit_calculate)
  end

  # In this method I get the result from the calculator and parse it to the same format that I send from the feature to make the comparison
  def result_credit
    @value = $from == 'lending' ? @@xp_txt_result : @@xp_txt_result_fees
    wait_displays(:xpath, @value, 2)
    get_result = get_element_text(:xpath, @value).gsub(/[.,$]/, '').strip
    get_result.should == $money
  end

  # This method is used to define the element to be used for both the "Calculate how much they lend you" functionality and the "Calculate the value of the installments"
  def validate_message(message)
    if $from == 'lending'
      value = $money == '' ? '2' : '1'
      @@xp_txt_message = "//p[contains(@class,'validacion ingresos_mensuales')][#{value}]"
    else
      @@xp_txt_message = $money == '' ? @@xp_txt_lower : @@xp_txt_higher
    end
    wait_displays(:xpath, @@xp_txt_message, 5)
    get_element_text(:xpath, @@xp_txt_message).should == message
  end

  def select_element(option_value)
    element = {
      'lending' => @@xp_drp_years,
      'fees' => @@xp_drp_years_quota
    }
    element[option_value]
  end
end
World(Lending)
