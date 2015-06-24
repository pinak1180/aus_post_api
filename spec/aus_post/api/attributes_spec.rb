require_relative "../../../lib/aus_post/api/attributes"

describe "Including the attributes module on a class" do
  it "should allow attributes to be specified using the required_attributes method" do
    test = Class.new do
      include AusPost::API::Attributes

      required_attributes :one, :two
    end.new

    expect(test.required_attributes).to eql([:one, :two])

    test.one = 1
    test.two = 2

    expect(test.one).to eql(1)
    expect(test.two).to eql(2)
  end

  it "should allow attributes to be specified using the optional_attributes method" do
    test = Class.new do
      include AusPost::API::Attributes

      optional_attributes :one, :two
    end.new

    expect(test.optional_attributes).to eql([:one, :two])

    test.one = 1
    test.two = 2

    expect(test.one).to eql(1)
    expect(test.two).to eql(2)
  end
end
