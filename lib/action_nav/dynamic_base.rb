require 'action_nav/common'

module ActionNav
  class DynamicBase < Common

    # Initialize a new navigation
    #
    # @param controller [ActionController::Base]
    # @return [ActionNav::DynamicBase]
    def initialize(controller)
      @controller = controller
      @active_paths = []
      create_items
    end

    # Implement this method to create items (evaluated
    # at the time the navigation is instantiated).
    def create_items
      fail
    end

    # Add a new item to this navigation
    #
    # @param id [Symbol]
    # @return [ActionNav::Item]
    def item(id, &block)
      item = Item.new(nil, id)
      item.dsl(&block) if block_given?
      instance = ItemInstance.new(self, item)
      items << instance unless instance.hidden?
    end

    # Return a full list of items for this instances as
    # instances.
    #
    # @return [Array<ActionNav::ItemInstance>]
    def items
      @items ||= []
    end

  end
end
