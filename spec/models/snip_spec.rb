require "rails_helper"

describe Snip do
  it { should belong_to(:user) }
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:content) }
end
