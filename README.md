# Limit Handling

## Prerequisites

To set up your environment, you'll need to following:

- A Ruby version manager ([RVM](https://rvm.io/) or [Rbenv](https://github.com/sstephenson/rbenv))
- The appropriate version of Ruby (defined in `.ruby-version`), along with the Bundler gem

## Setting up the environment

After cloning the repository, install the necessary gems:
```sh
bundle install
```

## Running the build

You can run the build with the following command:
```sh
bundle exec rake
```

The tests for the specified use cases are in `spec/system/use_cases_spec.rb`.
