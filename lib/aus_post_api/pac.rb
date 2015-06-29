module AusPostAPI
  # The PAC class implements methods specified by the Australia Post Postage
  # Assessment Calculator. A config hash must be supplied that specifies a valid
  # PAC_AUTH_KEY, and request format. Setting the key TEST to true in the config
  # hash will ignore any supplied auth_key and use the test endpoint.
  class PAC
    def initialize(config)
      @config = config
    end

    def domestic_postcode_search(params = {})
      AusPostAPI::PAC::DomesticPostcodeSearch.new(params, @config).execute
    end

    def country(params = {})
      AusPostAPI::PAC::Country.new(params, @config).execute
    end

    def domestic_letter_thickness(params = {})
      AusPostAPI::PAC::DomesticLetterThickness.new(params, @config).execute
    end

    def domestic_letter_weight(params = {})
      AusPostAPI::PAC::DomesticLetterWeight.new(params, @config).execute
    end

    def domestic_letter_size(params = {})
      AusPostAPI::PAC::DomesticLetterSize.new(params, @config).execute
    end

    def international_letter_weight(params = {})
      AusPostAPI::PAC::InternationalLetterWeight.new(params, @config).execute
    end

    def international_parcel_weight(params = {})
      AusPostAPI::PAC::InternationalParcelWeight.new(params, @config).execute
    end

    def domestic_parcel_weight(params = {})
      AusPostAPI::PAC::DomesticParcelWeight.new(params, @config).execute
    end

    def domestic_parcel_type(params = {})
      AusPostAPI::PAC::DomesticParcelType.new(params, @config).execute
    end

    def domestic_parcel_size(params = {})
      AusPostAPI::PAC::DomesticParcelSize.new(params, @config).execute
    end

    def postage_letter_domestic_service(params = {})
      AusPostAPI::PAC::PostageLetterDomesticService.new(params, @config).execute
    end

    def postage_parcel_domestic_service(params = {})
      AusPostAPI::PAC::PostageParcelDomesticService.new(params, @config).execute
    end

    def postage_letter_international_service(params = {})
      AusPostAPI::PAC::PostageLetterInternationalService.new(params, @config).execute
    end

    def postage_parcel_international_service(params = {})
      AusPostAPI::PAC::PostageParcelInternationalService.new(params, @config).execute
    end

    def postage_parcel_domestic_calculate(params = {})
      AusPostAPI::PAC::PostageParcelDomesticCalculate.new(params, @config).execute
    end

    def postage_parcel_international_calculate(params = {})
      AusPostAPI::PAC::PostageParcelInternationalCalculate.new(params, @config).execute
    end

    def postage_letter_domestic_calculate(params = {})
      AusPostAPI::PAC::PostageLetterDomesticCalculate.new(params, @config).execute
    end

    def postage_letter_international_calculate(params = {})
      AusPostAPI::PAC::PostageLetterInternationalCalculate.new(params, @config).execute
    end
  end
end
