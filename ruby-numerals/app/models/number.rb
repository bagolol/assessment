class Number
  include ActiveModel::Validations
  include ActiveModel::Conversion
  extend ActiveModel::Naming

  attr_accessor :number

  ONES = %w(one two three four five six seven eight nine)

  TEENS = %w(eleven twelve thirteen fourteen fifteen sixteen seventeen eighteen nineteen)

  TENS = %w(ten twenty thirty forty fifty
            sixty seventy eighty ninety)

  ERROR = 'please submit a positive number'

  validates :number, presence: true

  def initialize(attributes = {})
    attributes.each do |name, value|
      send("#{name}=", value)
    end
  end

  def number_is_valid?
    number >= 0
  end

  def spell_number(number)
    return ERROR unless number_is_valid?
    if number / 1000 > 0
      compose_word(number, 1000)
    elsif number / 100 > 0
     compose_word(number, 100)
    elsif number / 10 > 0
      if number > 19
        decimal = number / 10
        unit = number % 10
        return word = TENS[decimal - 1] if unit == 0
        word2 = spell_number(unit)
        word = TENS[decimal - 1] + '-' + word2
      else
        return "ten" if number == 10
        index = number % 10
        word = TEENS[index - 1]
      end
    elsif number / 10 < 1
      word = ONES[number - 1]
    end
  end

  def compose_word (number, divisor)
    overs = {100 => " hundred",
             1000 => " thousand"}
    unit = number / divisor
    left = number % divisor
    identifier = overs[divisor]
    return word = ONES[unit - 1] + identifier if left == 0
    remaining = spell_number(left)
    word = ONES[unit - 1] + identifier + ' ' + remaining
  end


  def persisted?
    false
  end
end
