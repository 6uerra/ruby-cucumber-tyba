# frozen_string_literal: true

require 'selenium-cucumber'
require 'selenium-webdriver'


Given 'my monthly income is {string}' do |money|
  insert_money(money)
end

And 'I want to know Calculate how much they lend you in a period of {string}' do |years|
  insert_years(years, 'lending')
end

And 'he made the simulation of my credit' do
  simulation
end

Then 'I validate the result of my credit' do
  result_credit
end

Then 'I validate that the error message is presented {string}' do |message|
  validate_message(message)
end
