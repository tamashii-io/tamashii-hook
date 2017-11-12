# frozen_string_literal: true

module Tamashii
  # :nodoc:
  class Hook
    include Singleton
    include Hookable

    class << self
      def respond_to_missing?(name, _include_private = false)
        instance.respond_to?(name)
      end

      def method_missing(name, *args, &block)
        return super unless respond_to_missing?(name)
        instance.send(name, *args, &block)
      end
    end
  end
end
