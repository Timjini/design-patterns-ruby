# frozen_string_literal: true

require_relative 'notification'

class SmsNotifications < Notification # rubocop:disable Style/Documentation
  def send_notification(user, message, config)
    service = Notification.new(user, message, config)
    service.notify
  end
end
