require 'spec_helper'

describe 'qaform' do

  before(:all) do
    @driver = Selenium::WebDriver.for :chrome #local environment it is set up as a path which is why we don't put the whole path name for chromedriver.
  end

  it "should click on the partial link and link test" do
      @driver.find_element(:link_text, 'Partial Link Test').click
      sleep 5
      @driver.find_element(:link_text, 'Link Test').click
      sleep 5
      @driver.navigate().back()
  end

  it 'should open the qafrom page' do
    @driver.get('http://toolsqa.com/automation-practice-form/') #current url selenium-webdriver
    expect(@driver.current_url).to eq 'http://toolsqa.com/automation-practice-form/'
    @driver.find_element(:name, 'firstname').displayed?
  end

  it 'should enter a name string into the first name text box' do
    @driver.find_element(:name, 'firstname').send_keys('alison')
    expect(@driver.find_element(:name, 'firstname')['value']).to eq('alison')
  end

  it 'should enter a name string into the last name text box' do
    @driver.find_element(:name, 'lastname').send_keys('opeloyeru')
    expect(@driver.find_element(:name, 'lastname')['value']).to eq('opeloyeru')
  end

  it 'should enter select the male and then female radio button' do
    @driver.find_element(:id, 'sex-0').click
    expect(@driver.find_element(:id, 'sex-0').selected?).to eq(true)

    @driver.find_element(:id, 'sex-1').click
    expect(@driver.find_element(:id, 'sex-1').selected?).to eq(true)
  end

  it 'should select the 1 years of experience radio button' do
    @driver.find_element(:id, 'exp-0').click
    expect(@driver.find_element(:id, 'exp-0').selected?).to eq(true)

    @driver.find_element(:id, 'exp-1').click
    expect(@driver.find_element(:id, 'exp-1').selected?).to eq(true)

    @driver.find_element(:id, 'exp-2').click
    expect(@driver.find_element(:id, 'exp-2').selected?).to eq(true)

    @driver.find_element(:id, 'exp-3').click
    expect(@driver.find_element(:id, 'exp-3').selected?).to eq(true)

    @driver.find_element(:id, 'exp-4').click
    expect(@driver.find_element(:id, 'exp-4').selected?).to eq(true)

    @driver.find_element(:id, 'exp-5').click
    expect(@driver.find_element(:id, 'exp-5').selected?).to eq(true)

    @driver.find_element(:id, 'exp-6').click
    expect(@driver.find_element(:id, 'exp-6').selected?).to eq(true)
  end

  it 'should enter a date string into the date text box' do
    @driver.find_element(:id, 'datepicker').send_keys('24/10/17')
    expect(@driver.find_element(:id, 'datepicker')['value']).to eq('24/10/17')
  end

  it 'should select the manual tester profession button' do
    @driver.find_element(:id, 'profession-0').click
    expect(@driver.find_element(:id, 'profession-0').selected?).to eq(true)

    @driver.find_element(:id, 'profession-1').click
    expect(@driver.find_element(:id, 'profession-1').selected?).to eq(true)
  end

  it 'should select the text of an uploaded documents' do
    @driver.find_element(id: 'photo').send_keys("/Users/tech-a59/Documents/test.txt")
    # upload = @driver.find_element(css: 'input[type="file" i]').text # <-- not working
    # expect(upload).to eql('test.txt')
  end

  it 'should click the url link' do
    @download = File.dirname("/Users/tech-a59/Downloads")
    @driver.find_element(:link_text, 'Selenium Automation Hybrid Framework').click
    files = Dir.glob("#{@download}/*")
    expect(files.empty?).to eql false
    expect(File.size(files.first)).to be > 0
    # expect(@driver.find_element(:link_text, 'Selenium Automation Hybrid Framework').selected?).to eq(true)

    @driver.find_element(:link_text, 'Test File to Download').click
    # expect(@driver.find_element(:link_text, 'Test File to Download').click?).to eq(true)
  end

  it 'should select the selenium webdriver button' do
    @driver.find_element(:id, 'tool-0').click
    expect(@driver.find_element(:id, 'tool-0').selected?).to eq(true)

    @driver.find_element(:id, 'tool-1').click
    expect(@driver.find_element(:id, 'tool-1').selected?).to eq(true)

    @driver.find_element(:id, 'tool-2').click
    expect(@driver.find_element(:id, 'tool-2').selected?).to eq(true)
  end

  it 'should select europe from the drop down menu' do
    dropdown = @driver.find_element(id: 'continents')
    select_list = Selenium::WebDriver::Support::Select.new(dropdown)

    select_list.select_by(:text, 'Asia')
    selected_option = select_list.selected_options[0].text
    expect(selected_option).to eql 'Asia'

    select_list.select_by(:text, 'Europe')
    selected_option = select_list.selected_options[0].text
    expect(selected_option).to eql 'Europe'

    select_list.select_by(:text, 'Africa')
    selected_option = select_list.selected_options[0].text
    expect(selected_option).to eql 'Africa'

    select_list.select_by(:text, 'Australia')
    selected_option = select_list.selected_options[0].text
    expect(selected_option).to eql 'Australia'

    select_list.select_by(:text, 'South America')
    selected_option = select_list.selected_options[0].text
    expect(selected_option).to eql 'South America'

    select_list.select_by(:text, 'North America')
    selected_option = select_list.selected_options[0].text
    expect(selected_option).to eql 'North America'

    select_list.select_by(:text, 'Antartica')
    selected_option = select_list.selected_options[0].text
    expect(selected_option).to eql 'Antartica'
  end

  it 'should select navigation commands from the select menu' do
    selectmenu = @driver.find_element(id: 'selenium_commands')
    select_list = Selenium::WebDriver::Support::Select.new(selectmenu)

    select_list.select_by(:text, 'Browser Commands')
    selected_option = select_list.selected_options[0].text
    expect(selected_option).to eq('Browser Commands')
    select_list.deselect_by(:text, 'Browser Commands')

    select_list.select_by(:text, 'Navigation Commands')
    selected_option = select_list.selected_options[0].text
    expect(selected_option).to eq('Navigation Commands')
    select_list.deselect_by(:text, 'Navigation Commands')

    select_list.select_by(:text, 'Switch Commands')
    selected_option = select_list.selected_options[0].text
    expect(selected_option).to eq('Switch Commands')
    select_list.deselect_by(:text, 'Switch Commands')

    select_list.select_by(:text, 'Wait Commands')
    selected_option = select_list.selected_options[0].text
    expect(selected_option).to eq('Wait Commands')
    select_list.deselect_by(:text, 'Wait Commands')

    select_list.select_by(:text, 'WebElement Commands')
    selected_option = select_list.selected_options[0].text
    expect(selected_option).to eq('WebElement Commands')
    select_list.deselect_by(:text, 'WebElement Commands')
  end

end
