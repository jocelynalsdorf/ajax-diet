require 'rails_helper'

describe Food do
  it { should validate_presence_of :type}
  it { should validate_presence_of :calories}
end
