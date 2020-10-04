# frozen_string_literal: true

module Fees
  # For the elements I use the structure of {access_type}_{type}__{name_element}
  @@xp_tab_fees = '//a[contains(@aria-controls,"calcredit Calcula el valor de las cuotas")]'
  @@name_txt_credit = 'loadAmount'
  @@xp_btn_fees = '//h4[contains(.,"Calcular Cuotas")]'

  def value_of_fees
    wait_displays(:xpath, @@xp_tab_fees, 1)
    click(:xpath, @@xp_tab_fees)
  end

  def insert_credit(money)
    $money = money
    wait_displays(:name, @@name_txt_credit, 1)
    enter_text(:name, $money, @@name_txt_credit)
  end

  def simulation_fees
    wait_displays(:xpath, @@xp_btn_fees, 1)
    click(:xpath, @@xp_btn_fees)
  end
end
World(Fees)
