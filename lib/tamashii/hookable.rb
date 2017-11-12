# frozen_string_literal: true

require 'singleton'

require 'tamashii/hookable/version'
require 'tamashii/hookable/container'
require 'tamashii/hook'

module Tamashii
  # Tamashii::Hookable
  module Hookable
    def before(event, handler = nil, &block)
      hook(:before, event, handler, &block)
    end

    def after(event, handler = nil, &block)
      hook(:after, event, handler, &block)
    end

    def hook(action, event, handler = nil, &block)
      _hook_container.register(action, event, handler, &block)
    end

    def run(event, *args, &block)
      run_before(event, *args)
      instance_exec(*args, &block) if block_given?
      run_after(event, *args)
    end

    def run_before(event, *args)
      _hook_container.execute("before_#{event}", *args)
    end

    def run_after(event, *args)
      _hook_container.execute("after_#{event}", *args)
    end

    private

    def _hook_container
      @_hook_container ||= Container.new(self)
    end
  end
end
