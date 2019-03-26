require 'action_nav/common'

module ActionNav
  class Base < Common

    # Return a full list of items for this instance as
    # instances.
    #
    # @return [Array<ActionNav::ItemInstance>]
    def items
      @items ||= self.class.items.each_with_object([]) do |(key, item), array|
        instance = ItemInstance.new(self, item)
        unless instance.hidden?
          array << instance
        end
      end
    end

    # Add a new item to this navigation
    #
    # @param id [Symbol]
    # @return [ActionNav::Item]
    def self.item(id, &block)
      item = Item.new(nil, id)
      item.dsl(&block) if block_given?
      items[id] = item
    end

    # Return all items for this navigation
    #
    # @return [Hash]
    def self.items
      @items ||= {}
    end

  end
end
