require_relative '../../lib/aus_post/api'

class NoOptionalAttrsConstSet; REQUIRED_ATTRS = []; end
class NoRequiredAttrsConstSet; OPTIONAL_ATTRS = []; end
class NoApiUriImplemeneted; REQUIRED_ATTRS = []; OPTIONAL_ATTRS = []; end

class CorrectlyImplementedClass
  REQUIRED_ATTRS = []
  OPTIONAL_ATTRS = []

  def api_uri
  end
end

class NullUriHandler; def self.call(*attrs) end; end

describe AusPost::API do
  let(:valid_test_config) {
    { test: true, format: AusPost::API::VALID_FORMATS.sample, auth_key: '123' }
  }

  describe "Implementing an API class" do
    describe "Required Constants" do
      it 'should define a REQUIRED_ATTRS const' do
        expect {
          NoRequiredAttrsConstSet.new.class.send(:include, AusPost::API)
        }.to raise_error(AusPost::API::ImplementationError)
      end

      it 'should define a OPTIONAL_ATTRS const' do
        expect {
          NoOptionalAttrsConstSet.new.class.send(:include, AusPost::API)
        }.to raise_error(AusPost::API::ImplementationError)
      end
    end

    describe "Implementing an api_uri method" do
      subject { NoApiUriImplemeneted.include(AusPost::API) }

      it "should raise an error if no api_uri is set" do
        instance = subject.new({}, valid_test_config, NullUriHandler)

        expect {
          instance.execute
        }.to raise_error(AusPost::API::ImplementationError)

        def instance.api_uri; ""; end

        expect { instance.execute }.to_not raise_error
      end
    end
  end


  describe "Configuring the API module" do
    subject { CorrectlyImplementedClass.include(AusPost::API) }

    describe "Setting an Auth Key" do
      context "the test configuration is set to true" do
        it "should not raise an error if no auth key is provided" do
          valid_test_config.delete(:auth_key)

          expect {
            subject.new({}, valid_test_config.merge(test: true))
          }.to_not raise_error
        end
      end

      context "the test configuration is set to false" do
        it "should raise an error if no auth key is provided" do
          valid_test_config.delete(:auth_key)

          expect {
            subject.new({}, valid_test_config.merge(test: false))
          }.to raise_error(
            AusPost::API::NoAuthKeyProvidedError
          )
        end
      end
    end

    describe "Setting a format" do
      context "no format is provided" do
        it "should raise an error" do
          valid_test_config.delete(:format)

          expect { subject.new({}, valid_test_config) }.to raise_error(
            AusPost::API::NoFormatProvidedError
          )
        end
      end

      context "an invalid format is provided" do
        it "should raise an error" do
          expect {
            subject.new({}, valid_test_config.merge(format: 'not valid'))
          }.to raise_error(
            AusPost::API::InvalidFormatError
          )
        end
      end
    end
  end
end
