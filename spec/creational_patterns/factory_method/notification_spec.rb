# frozen_string_literal: true

require 'spec_helper'
require_relative '../../../creational_patterns/factory_method/notification'

RSpec.describe Notification do
  describe '#notify users' do
    it 'sends notification' do
      user = 'first person'
      message = 'You got a new message'
      config = ''
      notification_service = Notification.new(user, message, config)
      send_notification = notification_service.notify

      expect(send_notification).to eq('Hello there')
    end
  end
end
