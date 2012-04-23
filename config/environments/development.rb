# Settings specified here will take precedence over those in config/environment.rb

# In the development environment your application's code is reloaded on
# every request.  This slows down response time but is perfect for development
# since you don't have to restart the webserver when you make code changes.
config.cache_classes = false

# Log error messages when you accidentally call methods on nil.
config.whiny_nils = true

# Show full error reports and disable caching
config.action_controller.consider_all_requests_local = true
config.action_view.debug_rjs                         = true
config.action_controller.perform_caching             = false

# error if mailer can't send?
config.action_mailer.raise_delivery_errors = true

# Email server SMTP setup
CONTACT_RECIPIENT_CAREERS = "kenzie@route19.com"
CONTACT_RECIPIENT_COMMENTS = "kenzie@route19.com"
ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.smtp_settings = {
  :tls => true,
  :address  => "smtp.gmail.com",
  :port  => 587,
  :user_name => "webserver@pizzatown.ca",
  :password => "69P689",
  :authentication => :login
}