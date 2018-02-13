# encoding: UTF-8
require 'spec_helper'
require_relative 'actionwords'

describe 'Coffee machine - Hiptest publisher sample' do
  include Actionwords

  it "Simple use (uid:77a30d2b-5438-4493-8bbf-27e6bf66b7ae)" do
    # Well, sometimes, you just get a coffee.
    # Tags: priority:high
    # Given the coffee machine is started
    the_coffee_machine_is_started
    # When I take a coffee
    i_take_a_coffee
    # Then coffee should be served
    coffee_should_be_served
  end

  context "Messages are based on language" do
    def messages_are_based_on_language(language, ready_message)
      # Tags: priority:medium
      # When I start the coffee machine using language "<language>"
      i_start_the_coffee_machine_using_language_lang(language)
      # Then message "<ready_message>" should be displayed
      message_message_should_be_displayed(ready_message)
    end

    it "English (uid:c1885638-f3a8-4acf-8a80-0c62af42230d)" do
      messages_are_based_on_language('en', 'Ready')
    end

    it "French (uid:46791f27-96dd-44a5-bb22-7c856e1a4e92)" do
      messages_are_based_on_language('fr', 'Pret')
    end
  end

  it "No messages are displayed when machine is shut down (uid:23bed01f-e9db-4421-b28e-cbe2f0f0b4b7)" do
    # Tags: priority:medium
    # Given the coffee machine is started
    the_coffee_machine_is_started
    # When I shutdown the coffee machine
    i_shutdown_the_coffee_machine
    # Then message "" should be displayed
    message_message_should_be_displayed("")
  end

  it "Display settings (uid:bd18d58c-974f-4f3c-9880-de278695ffc8)" do
    # Tags: priority:medium
    # Given the coffee machine is started
    the_coffee_machine_is_started
    # When I switch to settings mode
    i_switch_to_settings_mode
    # Then displayed message is:
    displayed_message_is("Settings:\n - 1: water hardness\n - 2: grinder")
  end

  it "Default settings (uid:123392a2-62e8-42a2-9136-7d222218a710)" do
    # Tags: priority:high
    # Given the coffee machine is started
    the_coffee_machine_is_started
    # When I switch to settings mode
    i_switch_to_settings_mode
    # Then settings should be:
    settings_should_be("| water hardness | 2      |\n| grinder        | medium |")
  end

  it "Message \"Fill beans\" is displayed after 38 coffees are taken (uid:6a3f4a19-8f48-4d8a-b0a4-1868c2653fcd)" do
    # Tags: priority:high
    # When I take "38" coffees
    i_take_coffee_number_coffees(38)
    # Then message "Fill beans" should be displayed
    message_message_should_be_displayed("Fill beans")
  end

  it "It is possible to take 40 coffees before there is really no more beans (uid:6964b35f-e52a-49b4-85fe-15bc3c91f6c8)" do
    # Tags: priority:low
    # When I take "40" coffees
    i_take_coffee_number_coffees(40)
    # Then coffee should be served
    coffee_should_be_served
    # When I take a coffee
    i_take_a_coffee
    # Then coffee should not be served
    coffee_should_not_be_served
    # And message "Fill beans" should be displayed
    message_message_should_be_displayed("Fill beans")
  end

  it "After adding beans, the message \"Fill beans\" disappears (uid:012585dc-a834-4937-806c-01e2d81b5f14)" do
    # Tags: priority:high
    # When I take "40" coffees
    i_take_coffee_number_coffees(40)
    # And I fill the beans tank
    i_fill_the_beans_tank
    # Then message "Ready" should be displayed
    message_message_should_be_displayed("Ready")
  end

  it "Message \"Empty grounds\" is displayed after 30 coffees are taken (uid:5b73258b-4214-4313-ab05-b6452ec4558d)" do
    # Tags: priority:high
    # When I take "30" coffees
    i_take_coffee_number_coffees(30)
    # Then message "Empty grounds" should be displayed
    message_message_should_be_displayed("Empty grounds")
  end

  it "When the grounds are emptied, message is removed (uid:6b3710ee-d165-49e1-8a8b-9ca2c2e28943)" do
    # Tags: priority:medium
    # When I take "30" coffees
    i_take_coffee_number_coffees(30)
    # And I empty the coffee grounds
    i_empty_the_coffee_grounds
    # Then message "Ready" should be displayed
    message_message_should_be_displayed("Ready")
  end

  it "Message \"Fill water tank\" is displayed after 50 coffees are taken (uid:8b7051fb-38bc-4cfc-9a50-83b0fea57c16)" do
    # Tags: priority:high
    # When I take "50" coffees
    i_take_coffee_number_coffees(50)
    # Then message "Fill tank" should be displayed
    message_message_should_be_displayed("Fill tank")
  end

  it "It is possible to take 10 coffees after the message \"Fill water tank\" is displayed (uid:c3ebc557-40b1-4eee-a26d-4235840c002d)" do
    # Tags: priority:low
    # When I take "60" coffees
    i_take_coffee_number_coffees(60)
    # Then coffee should be served
    coffee_should_be_served
    # When I take a coffee
    i_take_a_coffee
    # Then coffee should not be served
    coffee_should_not_be_served
  end

  it "When the water tank is filled, the message disappears (uid:27ac5908-63d7-447a-b392-26288969825a)" do
    # Tags: priority:high
    # When I take "55" coffees
    i_take_coffee_number_coffees(55)
    # And I fill the water tank
    i_fill_the_water_tank
    # Then message "Ready" should be displayed
    message_message_should_be_displayed("Ready")
  end

  it "Full grounds does not block coffee (uid:1dd926f5-61ed-49de-b8c3-b298d0f233a2)" do
    # You keep getting coffee even if the "Empty grounds" message is displayed. That said it's not a fantastic idea, you'll get ground everywhere when you'll decide to empty it.
    # Tags: priority:low
    # Given the coffee machine is started
    the_coffee_machine_is_started
    # And I handle everything except the grounds
    i_handle_everything_except_the_grounds
    # When I take "50" coffees
    i_take_coffee_number_coffees(50)
    # Then message "Empty grounds" should be displayed
    message_message_should_be_displayed("Empty grounds")
    # And coffee should be served
    coffee_should_be_served
  end
end
