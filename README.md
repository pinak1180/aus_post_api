AusPost

The AusPost gem is a wrapper around the Australia Post Developer API. Currently only the Postage Assesment Calculator (PAC) API is implemented.

## Documentation

Descriptions of each endpoints can be found at the Australia Post Developer API reference page. *see below for full list of endpoints that can be called from this gem*

## Usage

### Ruby
```
AusPost.new(config).some_aus_post_endpoint(params)
```

### Rails

```
# config/initializers/aus_post.rb

$aus_post = AusPost.new(config)

# app/some_file.rb

$aus_post.some_aus_post_endpoint(params)
```

## Configuration
The gem requires a `FORMAT` of either `'json'` or `'xml'`, and the `PAC_AUTH_KEY` to be set.

```
{
  FORMAT: 'xml'
  PAC_API_KEY: 123-456,
}
```

## Testing
If you are using the gem in a testing environment, or if you just want to jump in and use the gem without getting an auth key, set the config parameter `TEST: true`. This will use the Australia Post testing endpoint, and ignore any api keys provided.

*note: at the time of writing this the testing endpoint is unreliable. Consider getting additional api keys for testing purposes and not setting the TEST parameter in your tests*

## Endpoints

```
pac_domestic_postcode_search
pac_country
pac_domestic_letter_thickness
pac_domestic_letter_weight
pac_domestic_letter_size
pac_international_letter_weight
pac_international_parcel_weight
pac_domestic_parcel_weight
pac_domestic_parcel_type
pac_domestic_parcel_size
pac_postage_letter_domestic_service
pac_postage_parcel_domestic_service
pac_postage_letter_international_service
pac_postage_parcel_international_service
pac_postage_parcel_domestic_calculate
pac_postage_parcel_international_calculate
pac_postage_letter_domestic_calculate
pac_postage_letter_international_calculate
```
