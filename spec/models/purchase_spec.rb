require 'rails_helper'

describe Purchase, type: :model do
  it { is_expected.to validate_presence_of :name}
  it { is_expected.to validate_presence_of :email}
  it { is_expected.to validate_presence_of :robot_id}
end
