class Number
  extend ActiveModel::Naming
  include ActiveModel::Conversion

  attr_accessor :number, :name

  def initialize
    @name = ""
    @description = ""
  end

  def persisted?
    false
  end
end