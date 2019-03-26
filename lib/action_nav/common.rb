require 'action_nav/item'
require 'action_nav/item_instance'
require 'action_nav/item_dsl'

module ActionNav
  class Common

    # Initialize a new navigation
    #
    # @param controller [ActionController::Base]
    # @return [ActionNav::Common]
    def initialize(controller)
      @controller = controller
      @active_paths = []
    end

    # The controller that initialized this navigation.
    #
    # @return [ActionController::Base]
    attr_reader :controller
    attr_reader :active_paths

    # Add an active navigation by passing the full path to
    # active item.
    def activate(*parts)
      @active_paths.push(parts)
    end
    alias_method :active, :activate

    # Is the given active path?
    #
    # @return [Boolean]
    def active_path?(*parts)
      @active_paths.any? do |path|
        a = path.size.times.map { |i| path[0, path.size - i] }
        a.include?(parts)
      end
    end
  end
end
