require_relative "../../../lib/aus_post/api/attributes"

class AttributesTestClassOne
end

class AttributesTestClassTwo
end

describe "Including the attributes module on a class" do
  it "should add the required_attributes and optional_attributes class methods" do
    test = AttributesTestClassOne.new

    expect(!!defined?(test.class.required_attributes)).to eql(false)
    expect(!!defined?(test.class.optional_attributes)).to eql(false)

    test.class.include(AusPost::API::Attributes)

    expect(!!defined?(test.class.required_attributes)).to eql(true)
  end

  it "should add the required_attributes and optional_attributes instance methods" do
    test = AttributesTestClassTwo.new

    expect(!!defined?(test.required_attributes)).to eql(false)
    expect(!!defined?(test.optional_attributes)).to eql(false)

    test.class.include(AusPost::API::Attributes)
    test.class.send(:required_attributes, :one)
    test.class.send(:optional_attributes, :two)

    expect(test.required_attributes).to eql([:one])
    expect(test.optional_attributes).to eql([:two])

    expect(test.respond_to?(:one)).to eql(true)
    expect(test.respond_to?(:two)).to eql(true)
  end
end
