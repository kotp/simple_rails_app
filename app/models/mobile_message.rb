class MobileMessage < ActiveRecord::Base
  require 'uri'

  validates :platform, allow_blank: true, inclusion: {in: %w(android ios)}

  validates :message_type, presence: true, inclusion: {in: %w(webview alert)}

  validates_format_of :url, with: URI.regexp(%w(http https))
  validates_format_of :platform_version, :with => /\d\.\d(\.\d)?/
  validates_format_of :app_version, :with => /(\d\.){2}\d/

  validates_presence_of :message

  scope :active, where(:active => 't')
  scope :platform, lambda { |platform| where('platform = ? OR platform IS NULL', platform) }
  scope :platform_version, lambda { |platform_version| where('platform_version = ? OR platform_version IS NULL', platform_version) }
  scope :app_version, lambda { |app_version| where('app_version = ? OR app_version IS NULL', app_version)}

  attr_accessible :platform, :platform_version, :app_version, :message_type, :url, :message, :dismissible, :active

  def self.for_client(params)
    self.platform(params[:platform]).platform_version(params[:platform_version]).app_version(params[:app_version]).active
  end

end