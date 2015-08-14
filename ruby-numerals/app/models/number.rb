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
    error = 'please submit a positive number'
    if is_valid?
      word_index = self.number - 1;
      ONES[word_index]
    else
      return error
    end
  end

  def is_valid?
    self.number >= 0
  end




  def persisted?
    false
  end
end