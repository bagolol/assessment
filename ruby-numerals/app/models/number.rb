class Number

  include ActiveModel::Validations
  include ActiveModel::Conversion
  extend ActiveModel::Naming

  attr_accessor :number


  ONES = %w(one two three four five six seven eight nine)

  TEENS = %w(eleven twelve thirteen fourteen fifteen sixteen seventeen eighteen nineteen)

  TENS = %w(ten twenty thirty forty fifty
    sixty seventy eighty ninety)

  validates :number, :presence => true


  def initialize(attributes = {})
    attributes.each do |name, value|
      send("#{name}=", value)
    end
  end

  def spell_number
    words = []
    self.number = number
    error = 'please submit a positive number'
    if number_is_valid?
      if number < 10
        words << ONES[word_index(number)]
      elsif
        number >= 10 && number < 20
        words << TEENS[word_index(number)]
      elsif
        number > 19 && number < 100
        first = number / 10
        second = number % 10
        if second > 0
          words << TENS[first - 1] + '-' + ONES[second - 1]
        else
          words << TENS[first - 1]
        end
      elsif number >= 100

      end
    else
      return error
    end
    words.join
  end



  def word_index number
    (number % 10) - 1
  end

  def number_is_valid?
    self.number >= 0
  end


  def persisted?
    false
  end
end