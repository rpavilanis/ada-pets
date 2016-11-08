require 'test_helper'

class PetTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  def assert_validation model, fields, message
    refute model.valid?
      fields.each do |field|
        assert (model.errors.include? field.to_sym),  "#{field} - #{message}"
        assert (model.errors[field.to_sym].include? message), "#{field} - #{message}"
      end
  end

  test "as_json works and provides the fields required" do
    pet = Pet.new(name:"Kylo", age:14, human: "Kari")
    pet.save

    fields = %w(name age human id)

    fields.each do |field|
      assert_not_nil pet.as_json()[field]
    end
  end

  test "Test Required fields" do
    pet = Pet.new
    assert_validation pet, %w(name human age), "can't be blank"
  end
end
