MemoHack::Application.configure do
  ENV['TUMBLR_KEY']='BsAJUThiHasUx7k4WhYfiyBjMXEdgt5IDYdVi4vRYYwSyTfH5I'
  ENV['TUMBLR_SECRET']='L1gXmEnmPFgkw5CcsozMpvhmTEI0tFKLbaw92rrP11NLsQVJwc'
  ENV['SECRET_TOKEN']='e0e0bd214d3be7e36815ccbac51240d47af9498d1f98575100c963e255c31a0a3566e461d8335eb3aaa045302b196722c5a39c83a8a8e1c2c7f3fc6e8528023d'


  # Settings specified here will take precedence over those in config/application.rb

  # The test environment is used exclusively to run your application's
  # test suite. You never need to work with it otherwise. Remember that
  # your test database is "scratch space" for the test suite and is wiped
  # and recreated between test runs. Don't rely on the data there!
  config.cache_classes = true

  # Configure static asset server for tests with Cache-Control for performance
  config.serve_static_assets = true
  config.static_cache_control = "public, max-age=3600"

  # Log error messages when you accidentally call methods on nil
  config.whiny_nils = true

  # Show full error reports and disable caching
  config.consider_all_requests_local       = true
  config.action_controller.perform_caching = false

  # Raise exceptions instead of rendering exception templates
  config.action_dispatch.show_exceptions = false

  # Disable request forgery protection in test environment
  config.action_controller.allow_forgery_protection    = false

  # Tell Action Mailer not to deliver emails to the real world.
  # The :test delivery method accumulates sent emails in the
  # ActionMailer::Base.deliveries array.
  config.action_mailer.delivery_method = :test

  # Raise exception on mass assignment protection for Active Record models
  config.active_record.mass_assignment_sanitizer = :strict

  # Print deprecation notices to the stderr
  config.active_support.deprecation = :stderr
end
