class MobileMessage < ActiveRecord::Base
  require 'uri'

  validates :platform, allow_blank: true, inclusion: {in: %w(android ios)}

  validates :platform_version, allow_blank: true, inclusion: {in: %w(1 2 3)}, if: lambda { self.platform == "ios" }

  validates :app_version, allow_blank: true, inclusion: {in: %w(1.0 1.0.1)}
  validates :message_type, presence: true, inclusion: {in: %w(webview alert)}
  validates_format_of :url, with: URI.regexp(%w(http https))
  validates_presence_of :message

  attr_accessible :platform, :platform_version, :app_version, :message_type, :url, :message, :dismissible, :active
end