# POC Action Mailbox

[![Github Actions CI](https://github.com/rootstrap/poc-action-mailbox/actions/workflows/ci.yml/badge.svg?event=push)](https://github.com/rootstrap/rails_api_base/actions)
[![Code Climate](https://codeclimate.com/github/rootstrap/rails_api_base/badges/gpa.svg)](https://codeclimate.com/github/rootstrap/rails_api_base)
[![Test Coverage](https://api.codeclimate.com/v1/badges/63de7f82c79f5fe82f46/test_coverage)](https://codeclimate.com/github/rootstrap/rails_api_base/test_coverage)

POC Action Mailbox is a proof of concept of Action Mailbox
The idea of this development is to learn step by step how Action Mailbox works

## What is Action Mailbox
Action Mailbox routes incoming emails to controller-like mailboxes for processing in Rails. 
Check the ruby doc [here](https://guides.rubyonrails.org/action_mailbox_basics.html). 

In other words, the ability to receive emails directly to the ruby app and handle them.

### Example use case where to use it

imaging we have a client that we need to create a Customer Service Platform, a [mini zendesk's version](https://www.zendesk.com).
Customer need in bullets:
1. receive emails from his customer
2. create a ticket and send a email notification to the customer
3. Tracking the dialog customer - support. 
   - The customer or support should replay that email and this action will create a dialog on that ticket

In this POC, we will address the point 1 and 3. 


## Working with Action Mailbox in development 
It's helpful to be able to test incoming emails in development without actually sending and receiving 
real emails. To accomplish this, there's a conductor controller mounted at
[rails/conductor/action_mailbox/inbound_emails](localhost:3000/rails/conductor/action_mailbox/inbound_emails), which gives you an index of all the InboundEmails 
in the system, their state of processing, and a form to create a new InboundEmail as well.
[doc](https://guides.rubyonrails.org/action_mailbox_basics.html#working-with-action-mailbox-in-development)

**NOTE** 
To use this feature, you application must not be api only. You can set `config.api_only = false` into config/application.rb file

To use Action Mailbox you must run the following commands:

``` 
$ bin/rails action_mailbox:install
$ bin/rails db:migrate 
```

#### Generate new mailbox

``$ bin/rails generate mailbox forwards``

#### Routing emails

`application_mailbox.rb` file is in charge to root emails using regular expressions. For regular expression, please check 
[https://rubular.com/](https://rubular.com/)

## How to use this repo

1. Clone this repo
1. Install PostgreSQL in case you don't have it
1. Run `bootstrap.sh` with the name of your project like `./bootstrap.sh --name=my_awesome_project`
1. `rspec` and make sure all tests pass
1. `rails s`
1. You can now try your REST services!

## How to use with docker

1. Have `docker` and `docker-compose` installed (You can check this by doing `docker -v` and `docker-compose -v`)
1. Run `bootstrap.sh` with the name of your project and the `-d` or `--for-docker` flag like `./bootstrap.sh --name=my_awesome_project -d`
    1. Run `./bootstrap.sh --help` for the full details.
1. Generate a secret key for the app by running `bin/web rake secret`, copy it and add it in your environment variables.
1. (Optional) If you want to deny access to the database from outside of the `docker-compose` network, remove the `ports` key in the `docker-compose.yml` from the `db` service.
1. (Optional) Run the tests to make sure everything is working with: `bin/rspec .`.
1. You can now try your REST services!

## Dev scripts
This template provides a handful of scripts to make your dev experience better!

- bin/bundle to run any `bundle` commands.
  - `bin/bundle install`
- bin/rails to run any `rails` commands
  - `bin/rails console`
- bin/web to run any `bash` commands
  - `bin/web ls`
- bin/rspec to run specs
  - `bin/rspec .`

You don't have to use these but they are designed to run the same when running with docker or not.
To illustrate, `bin/rails console` will run the console in the docker container when running with docker and locally when not.


## Optional configuration

- Set your [frontend URL](https://github.com/cyu/rack-cors#origin) in `config/initializers/rack_cors.rb`
- Set your mail sender in `config/initializers/devise.rb`
- Config your timezone accordingly in `application.rb`.

## Code quality

With `bundle exec rails code:analysis` you can run the code analysis tool, you can omit rules with:

- [Rubocop](https://github.com/bbatsov/rubocop/blob/master/config/default.yml) Edit `.rubocop.yml`
- [Reek](https://github.com/troessner/reek#configuration-file) Edit `config.reek`
- [Rails Best Practices](https://github.com/flyerhzm/rails_best_practices#custom-configuration) Edit `config/rails_best_practices.yml`
- [Brakeman](https://github.com/presidentbeef/brakeman) Run `brakeman -I` to generate `config/brakeman.ignore`
- [Bullet](https://github.com/flyerhzm/bullet#whitelist) You can add exceptions to a bullet initializer or in the controller

## Configuring Code Climate
1. After adding the project to CC, go to `Repo Settings`
1. On the `Test Coverage` tab, copy the `Test Reporter ID`
1. Set the current value of `CC_TEST_REPORTER_ID` in the [circle-ci project env variables](https://circleci.com/docs/2.0/env-vars/#setting-an-environment-variable-in-a-project)

## Code Owners

You can use [CODEOWNERS](https://help.github.com/en/articles/about-code-owners) file to define individuals or teams that are responsible for code in the repository.

Code owners are automatically requested for review when someone opens a pull request that modifies code that they own.

## Credits

Rails Api Base is maintained by [Rootstrap](http://www.rootstrap.com) with the help of our
[contributors](https://github.com/rootstrap/rails_api_base/contributors).

[<img src="https://s3-us-west-1.amazonaws.com/rootstrap.com/img/rs.png" width="100"/>](http://www.rootstrap.com)
