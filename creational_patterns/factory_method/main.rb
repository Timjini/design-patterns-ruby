# frozen_string_literal: true

require_relative 'notification'
# notify user by email
email = Notification::Factory.create(:email, 'user@example.com', 'Hello!')
puts email.send

puts "Registered types: #{Notifications::Factory.registered_types}"
