# frozen_string_literal: true

require_relative "../algorithms/binary_search.rb"

describe "binary_search" do
  it "returns 0" do
    expect(binary_search([1, 2, 3, 4], 1)).to eql 0
  end

  it "returns 3" do
    expect(binary_search([1, 2, 3, 4], 4)).to eql 3
  end

  it "returns 5" do
    expect(binary_search([20, 30, 44, 55, 88, 90], 90)).to eql 5
  end

  it "returns 6" do
    expect(binary_search([1, 35, 36, 37, 38, 39, 999], 999)).to eql 6
  end

  it "returns Value not in array" do
    expect(binary_search([1, 2, 3], 999)).to eql "Value not in array"
  end
end
