# playship plugin

[![fastlane Plugin Badge](https://rawcdn.githack.com/fastlane/fastlane/master/fastlane/assets/plugin-badge.svg)](https://rubygems.org/gems/fastlane-plugin-playship)

## Getting Started

This project is a [fastlane](https://github.com/fastlane/fastlane) plugin. To get started with `fastlane-plugin-playship`, add it to your project by running:

```bash
fastlane add_plugin playship
```

## About

Exposes a initialized AndroidpublisherV2 instance

## Example

```ruby
  client = playship(key: "~/Desktop/CLOUD_DRIVE_OLD/FXF/FXF-ANDROID/fastlane/google_play_key.json").client
```

### List in-app-purchases

```ruby
lane :list_iaps do
  client = playship(key: "~/Desktop/CLOUD_DRIVE_OLD/FXF/FXF-ANDROID/fastlane/google_play_key.json").client
  iaps = client.list_in_app_products("at.krone.epaper", token: nil)

  next_page = nil
  begin
    products = client.list_in_app_products("at.krone.epaper", token: next_page)
    products.inappproduct.each do | p |
      UI.important("IAP: #{p.sku}")
    end
    next_page = products.token_pagination.next_page_token
  end while next_page
end
```

### get a interactive playground

```ruby
lane :playground do
  require "pry"
  client = playship(key: "~/Desktop/CLOUD_DRIVE_OLD/FXF/FXF-ANDROID/fastlane/google_play_key.json")
  binding.pry
end

```

## Issues and Feedback

For any other issues and feedback about this plugin, please submit it to this repository.


## About `fastlane`

`fastlane` is the easiest way to automate beta deployments and releases for your iOS and Android apps. To learn more, check out [fastlane.tools](https://fastlane.tools).
