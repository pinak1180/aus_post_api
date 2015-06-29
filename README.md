# AusPost

The AusPostAPI gem is a wrapper around the Australia Post Developer API. Currently only the Postage Assesment Calculator (PAC) API is implemented.

## Documentation

Full and up to date documentation can be found at https://developers.auspost.com.au/apis

*see below for full list of endpoints that can be called from this gem*

## Usage

### Ruby

```ruby
AusPostAPI::PAC.new(config).endpoint(params)
```

### Rails

```ruby
# config/initializers/aus_post_api.rb

$aus_post_api = AusPost.new(config)

# app/some_file.rb

$aus_post_api.endpoint(params)
```

## Configuration
The gem requires a `FORMAT` of either `'json'` or `'xml'`, and the `PAC_AUTH_KEY` to be set. You can get an auth key at https://developers.auspost.com.au/sign-up-for-an-API-key

```ruby
{
  FORMAT: 'xml',
  PAC_API_KEY: 123-456
}
```

## Endpoints

There are no validations on any parameters. Consult the Australia Post documentation for what units and limitations apply.

```
domestic_postcode_search
  Required Attributes:
    - q
  Optional Attributes:
    - state
    - excludepostboxflag

country

domestic_letter_thickness

domestic_letter_weight

domestic_letter_size

international_letter_weight

international_parcel_weight

domestic_parcel_weight

domestic_parcel_type

domestic_parcel_size

postage_letter_domestic_service
  Required Attributes:
    - length
    - width
    - thickness
    - weight

postage_parcel_domestic_service
  Required Attributes:
    - from_postcode
    - to_postcode
    - length
    - width
    - height
    - weight

postage_letter_international_service
  Required Attributes:
    - country_code
    - weight

postage_parcel_international_service
  Required Attributes:
    - country_code
    - weight

postage_parcel_domestic_calculate
  Required Attributes:
    - from_postcode
    - to_postcode
    - length
    - width
    - height
    - weight
    - service_code
  Optional Attributes:
    - option_code
    - suboption_code
    - extra_cover

postage_parcel_international_calculate
  Required Attributes:
    - country_code
    - weight
    - service_code
  Optional Attributes:
    - option_code
    - suboption_code
    - extra_cover

postage_letter_domestic_calculate
  Required Attributes:
    - service_code
    - weight
  Optional Attributes:
    - option_code
    - suboption_code
    - extra_cover

postage_letter_international_calculate
  Required Attributes:
    - country_code
    - service_code
  Optional Attributes:
    - weight
    - option_code
    - suboption_code
    - extra_cover
```

## Testing
Set the config `TEST: true` for use in testing environments. This will use the Australia Post testing endpoint, and ignore any api keys provided.

*note: at the time of writing this the testing endpoint is unreliable. Consider getting additional api keys for testing purposes and not setting the TEST parameter in your tests*

## Contributing
Fork and PR!
