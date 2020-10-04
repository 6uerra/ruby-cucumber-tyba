# frozen_string_literal: true

require 'selenium-cucumber'
require 'selenium-webdriver'


Given 'selected the option Calculate the value of the installments' do
  value_of_fees
end

Given('I want to know Calculate how much they lend you in a period of {string} by quota') do |years|
  insert_years(years, 'fees')
end

Given 'I want to request a credit worth {string}' do |money|
  insert_credit(money)
end

Then 'I do the simulation of the quotas' do
  simulation_fees
end
