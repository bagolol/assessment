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

  validates :number, :presence => true


  def initialize(attributes = {})
    attributes.each do |name, value|
      send("#{name}=", value)
    end
  end

  def number_is_valid?
    self.number >= 0
  end


  def spell_number number
    return ERROR if !number_is_valid?
    word = ''
    if number/1000 > 0
      unit = number/1000
      left = number%1000
      return word = ONES[unit-1] + '-thousand' if left == 0
      remaining = spell_number(left)
      word = ONES[unit-1] + '-thousand-' + remaining
    elsif number/100 > 0
      unit = number/100
      left = number%100
      return word = ONES[unit-1] + '-hundred' if left == 0
      remaining = spell_number(left)
      word = ONES[unit-1] + '-hundred-' + remaining
    elsif number/10 > 0
      if number == 10
        word = 'ten'
      elsif number > 19
        decimal = number/10
        unit = number%10
        return word = TENS[decimal-1] if unit == 0
        word2 = spell_number(unit)
        word = TENS[decimal-1] + '-' + word2
      else
        index = number%10
        word = TEENS[index-1]
      end
    elsif number/10 < 1
      word = ONES[number - 1]
    end
  end

  def persisted?
    false
  end
end