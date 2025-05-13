# frozen_string_literal: true

module Notifications
  class Base # rubocop:disable Style/Documentation
    def self.inherited(subclass) # rubocop:disable Lint/MissingSuper
      type = subclass.name.demodulize.underscore.sub('_notification', '')
      Notifications::Factory.register(type, subclass)
    end

    def initialize(recipient, message)
      @recipient = recipient
      @message = message
    end

    def send
      raise NotImplementedError
    end

    private

    def log_success
      puts "#{self.class} successfully sent to #{@recipient}"
    end

    def log_error(error)
      puts "Error sending #{self.class} to #{@recipient}: #{error.message}"
    end
  end
end
