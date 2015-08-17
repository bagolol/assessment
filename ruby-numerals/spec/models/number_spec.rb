require 'spec_helper'

describe Number, type: :model do

  it { should respond_to(:number) }
  it { should respond_to(:spell_number) }
  it { should respond_to(:compose_word) }
  it { should respond_to(:number_is_valid?) }
end