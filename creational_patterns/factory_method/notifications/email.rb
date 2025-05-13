# frozen_string_literal: true

require_relative 'notification'

class Notifications::Email < Notifications::Base # rubocop:disable Style/Documentation,Style/ClassAndModuleChildren
  def send
    # SMTP implementation
    puts "Sending email to #{@recipient} via SMTP: #{@message}"
    log_success
    true
  rescue StandardError => e
    log_error(e)
    false
  end
end

# auto registry
NotificationFactory.register(:email, EmailNotification)
