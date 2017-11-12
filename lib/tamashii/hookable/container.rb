# frozen_string_literal: true

module Tamashii
  module Hookable
    # :nodoc:
    class Container < Hash
      def register(action, name, handler = nil, &block)
        hooks("#{action}_#{name}").push(handler || block)
      end

      def execute(name, *args)
        hooks(name).each do |hook|
          next hook.new(*args).process if hook.is_a?(Class)
          hook.call(*args)
        end
      end

      private

      def hooks(name)
        self[name] ||= []
      end
    end
  end
end
