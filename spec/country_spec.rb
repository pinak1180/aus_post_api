require 'spec_helper'

describe Country do
  let(:required_attributes) { {} }
  let(:optional_attributes) { {} }

  it_behaves_like 'an api'
end
