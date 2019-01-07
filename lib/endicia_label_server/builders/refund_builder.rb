require 'ox'

module EndiciaLabelServer
  module Builders
    class RefundBuilder < BuilderBase
      include Ox

      def initialize(opts = {}, root_attributes = nil)
        super('RefundRequest', opts, root_attributes)
      end

      def add(key, value, parent_element = nil)
        parent = parent_element || root

        key = (key.is_a? String) ? key : Util.camelize(key, key.to_s =~ /transaction_id/)

        return add_element_from_hash_values(parent, key, value) if value.is_a?(Hash)
        return add_element_from_array_items(parent, key, value) if value.is_a?(Array)
        return add_single_element(parent, key, value)
      end


      def post_field
        'refundRequestXML'
      end
    end
  end
end
