class AusPost
  module PAC
    def pac_domestic_postcode_search(params)
      AusPost::PAC::DomesticPostcodeSearch.new(params, @config).execute
    end

    def pac_country(params)
      AusPost::PAC::Country.new(params, @config).execute
    end

    def pac_domestic_letter_thickness(params)
      AusPost::PAC::DomesticLetterThickness.new(params, @config).execute
    end

    def pac_domestic_letter_weight(params)
      AusPost::PAC::DomesticLetterWeight.new(params, @config).execute
    end

    def pac_domestic_letter_size(params)
      AusPost::PAC::DomesticLetterSize.new(params, @config).execute
    end

    def pac_postage_parcel_domestic_service(params)
      AusPost::PAC::PostageParcelDomesticService.new(params, @config).execute
    end

    def pac_postage_parcel_domestic_calculate(params)
      AusPost::PAC::PostageParcelDomesticCalculate.new(params, @config).execute
    end

    def pac_postage_parcel_international_service(params)
      AusPost::PAC::PostageParcelInternationalService.new(params, @config).execute
    end

    def pac_postage_parcel_international_calculate(params)
      AusPost::PAC::PostageParcelInternationalCalculate.new(params, @config).execute
    end
  end
end
