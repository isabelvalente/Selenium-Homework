require 'spec_helper'

describe 'testing the demoqa registration page' do

  before(:all) do
    @driver = SeleniumDemoReg.new
    @driver.access_registration_form
  end

  context 'positive paths for the registration form and register' do

    it 'should land on the registration for page' do
      expect(@driver.current_url).to include('http://demoqa.com/registration/')
    end

    it 'should accept a first name' do
      @driver.last_name_field_displayed
      @driver.set_first_name_field('Izzy')
      expect(@driver.get_first_name_field_value).to eq 'Izzy'
    end

    it 'should accept a last name' do
      @driver.last_name_field_displayed
      @driver.set_last_name_field('Valente')
      expect(@driver.get_last_name_field_value).to eq 'Valente'
    end

    it 'should accept a marital status selection of Single, Married, or Divorced' do
      @driver.select_marital_option('Single')
    end

    it 'should accept a hobby status selection of Dance, Reading, or Cricket' do
      @driver.select_hobby_option('Dance')
    end

    it 'should have a country default of Afghanistan' do
      expect(@driver.get_selected_country).to include('Afghanistan')
    end

    it 'accept a new DOB' do
      @driver.dob_day_list_select('19')
      expect(@driver.get_dob_day).to eq('19')
      @driver.dob_month_list_select('4')
      expect(@driver.get_dob_month).to eq('4')
      @driver.dob_year_list_select('1994')
      expect(@driver.get_dob_year).to eq('1994')
    end

    it 'should accept a new country value' do
      @driver.country_dropdown_list_select('Colombia')
      expect(@driver.get_selected_country).to include('Colombia')
    end

    it 'should accept a valid phone number' do
      @driver.set_phone_number('07535077533')
      expect(@driver.get_phone_number).to be_an Integer
    end

    it 'should accept a username' do
      @driver.set_user_name_field('Izzy2018')
      expect(@driver.get_user_name_field_value).to be_a String
    end

    it 'should accept a valid email' do
      @driver.set_email_field('izzsparta@global.com')
      expect(@driver.get_email_field_value).to be_a String and include('@')
    end

    it 'should accept a about yourself text' do
      @driver.set_about_yourself_field('I\'m great and everything it a concept')
      expect(@driver.get_about_yourself_value).to be_a String
    end

    it 'should accept a password' do
      @driver.set_password_field('Acad3my1')
      expect(@driver.get_password_value).to be_a String
    end

    it 'should accept a password confirmation' do
      @driver.set_confirmation_password_field('Acad3my1')
      expect(@driver.get_confirmation_password_value).to match(@driver.get_password_value)
    end

  end

end
