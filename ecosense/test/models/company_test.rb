require 'test_helper'

class CompanyTest < ActiveSupport::TestCase
  def setup
    @company = Company.new(name: "Companhia melaça", address: "Rua Melaça", company_number: "916969696", about: "About melaço about melaço about melaço")
  end

  test "should be valid" do
    assert @company.valid?
  end

  test "name should be present" do
  	@company.name = "   "
    assert_not @company.valid?
  end

  test "address should be present" do
  	@company.address = "   "
    assert_not @company.valid?
  end

  test "company_number can be blank" do
  	@company.company_number = "   "
    assert @company.valid?
  end

  test "about can be blank" do
  	@company.about = "   "
    assert @company.valid?
  end
end
