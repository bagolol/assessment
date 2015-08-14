class Number

  include ActiveModel::Validations
  include ActiveModel::Conversion
  extend ActiveModel::Naming

  attr_accessor :number

  chunks = []

  ONES = %w(one two three four five six seven eight nine)

  TEENS = %w(eleven twelve thirteen fourteen fifteen sixteen seventeen eighteen nineteen)

  TENS = %w(ten twenty thirty forty fifty
    sixty seventy ninety)



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
        ONES[word_index(number)]
      elsif
        number > 10 && number < 20
        TEENS[word_index(number)]
      elsif
        number > 19 && number < 100
        first = number / 10
        second = number % 10
        TENS[first - 1] + '-' + ONES[second - 1]
      end
    else
      return error
    end
  end

  def word_index number
    (number % 10) - 1
  end

  def is_valid?
    self.number >= 0
  end


  def persisted?
    false
  end
end