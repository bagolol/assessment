class Number

  include ActiveModel::Validations
  include ActiveModel::Conversion
  extend ActiveModel::Naming

  attr_accessor :number

  ONES = %w(one two three four five six seven eight nine)

  validates :number, :presence => true


  def initialize(attributes = {})
    attributes.each do |name, value|
      send("#{name}=", value)
    end
  end

  def spell_number
    word_index = self.number - 1;
    ONES[word_index]
  end



  def persisted?
    false
  end
end