# frozen_string_literal: true

class Notification::Factory # rubocop:disable Style/Documentation,Style/ClassAndModuleChildren
  @@registry = {} # rubocop:disable Style/ClassVars

  def self.register(type, klass)
    @@registry[type.to_sym] = klass
  end

  def self.create(type, *args)
    @@registry[type.to_sym]&.new(*args) ||
      raise(ArgumentError, "Unknown type: #{type}")
  end

  def self.registered_types
    @@registry.keys
  end
end
# Load all notifications (important!)
Dir[File.join(__dir__, 'notifications', '*.rb')].sort.each { |f| require f }
