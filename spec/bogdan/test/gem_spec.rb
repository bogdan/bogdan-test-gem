# frozen_string_literal: true

RSpec.describe Bogdan::Test::Gem do
  it "has a version number" do
    expect(Bogdan::Test::Gem::VERSION).not_to be nil
  end

  it "does something useful" do
    expect(false).to eq(true)
  end
end
