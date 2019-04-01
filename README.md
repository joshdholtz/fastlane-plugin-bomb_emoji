# bomb_emoji plugin 💣💥💣💥💣💥💣💥

[![fastlane Plugin Badge](https://rawcdn.githack.com/fastlane/fastlane/master/fastlane/assets/plugin-badge.svg)](https://rubygems.org/gems/fastlane-plugin-bomb_emoji)

## Getting Started

This project is a [_fastlane_](https://github.com/fastlane/fastlane) plugin. To get started with `fastlane-plugin-bomb_emoji`, add it to your project by running:

```bash
fastlane add_plugin bomb_emoji
```

## About bomb_emoji

No more emojis 🙌🎊🎉

```rb
bomb_emoji

lane :test do
  UI.message "🚀 <-- should NOT have rocket emoji and no emojis after this"
end
```

### Before

```sh
➜  fastlane-plugin-bomb_emoji git:(master) ✗ fastlane test
[08:08:51]: Driving the lane 'test' 🚀
[08:08:51]: 🚀 <-- should NOT have rocket emoji and no emojis after this
[08:08:51]: fastlane.tools finished successfully 🎉
```

### After

```sh
➜  fastlane-plugin-bomb_emoji git:(master) ✗ fastlane test
[08:03:01]: Driving the lane 'test'
[08:03:01]:  <-- should NOT have rocket emoji and no emojis after this
[08:03:01]: fastlane.tools finished successfully
fastlane-plugin-bomb_emoji saved you 2 emoji
````

## Example

Check out the [example `Fastfile`](fastlane/Fastfile) to see how to use this plugin. Try it by cloning the repo, running `fastlane install_plugins` and `bundle exec fastlane test`.

## Run tests for this plugin

To run both the tests, and code style validation, run

```
rake
```

To automatically fix many of the styling issues, use
```
rubocop -a
```

## Issues and Feedback

For any other issues and feedback about this plugin, please submit it to this repository.

## Troubleshooting

If you have trouble using plugins, check out the [Plugins Troubleshooting](https://docs.fastlane.tools/plugins/plugins-troubleshooting/) guide.

## Using _fastlane_ Plugins

For more information about how the `fastlane` plugin system works, check out the [Plugins documentation](https://docs.fastlane.tools/plugins/create-plugin/).

## About _fastlane_

_fastlane_ is the easiest way to automate beta deployments and releases for your iOS and Android apps. To learn more, check out [fastlane.tools](https://fastlane.tools).
