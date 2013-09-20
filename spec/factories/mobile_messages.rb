require 'factory_girl'

FactoryGirl.define do
  factory :mobile_message do
    platform 'ios'
    platform_version '1.0'
    app_version '1.0.0'
    message_type 'alert'
    url 'http://test.com/'
    message 'test'
    dismissible 'f'
    active 't'
  end
end
