class Number

  include ActiveModel::Validations
  include ActiveModel::Conversion
  extend ActiveModel::Naming

  attr_accessor :number

  chunks = []

  ONES = %w(one two three four five six seven eight nine)

  TEENS = %w(eleven, twelve, thirteen, fourteen, fifteen, sixteen, seventeen, eighteen, nineteen)

  validates :number, :presence => true


  def initialize(attributes = {})
    attributes.each do |name, value|
      send("#{name}=", value)
    end
  end

  def spell_number
    self.number = number
    error = 'please submit a positive number'
    if is_valid?
      if number < 10
        word_index = number - 1
        ONES[word_index]
      elsif
        number > 10 && number < 20
        word_index = (number % 10) - 1
        TEENS[word_index]
      end
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