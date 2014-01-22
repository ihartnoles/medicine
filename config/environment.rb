# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
Medicine::Application.initialize!


CASClient::Frameworks::Rails::Filter.configure(
  :cas_base_url => "https://sso.fau.edu/"
)