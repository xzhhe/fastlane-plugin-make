# make plugin

[![fastlane Plugin Badge](https://rawcdn.githack.com/fastlane/fastlane/master/fastlane/assets/plugin-badge.svg)](https://rubygems.org/gems/fastlane-plugin-make)

## Getting Started

This project is a [_fastlane_](https://github.com/fastlane/fastlane) plugin. To get started with `fastlane-plugin-make`, add it to your project by running:

```bash
fastlane add_plugin make
```

## About make

Linux GNU Makefile make wrapper

**Note to author:** Add a more detailed description about this plugin here. If your plugin contains multiple actions, make sure to mention them here.

## Example

### Makefile

> /Users/xiongzenghui/Desktop/amake

```makefile
hello:
	@echo "hello"

world:
	@echo "world"

welcome:
	@echo "welcome"

all:
	@echo ${NAME}
	@echo ${AGE}
```

### make

```ruby
make(file: '/Users/xiongzenghui/Desktop/amake')
```

```ruby
make(
  file: '/Users/xiongzenghui/Desktop/amake',
  target: 'all'
)
```

```ruby
make(
  file: '/Users/xiongzenghui/Desktop/amake',
  target: 'all',
  envs: {NAME: 'xiongzenghui', AGE: 99}
)
```

```ruby
make(
  file: '/Users/xiongzenghui/Desktop/amake',
  target: 'all',
  envs: {NAME: 'xiongzenghui', AGE: 99},
  jobs: '2'
)
```


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
