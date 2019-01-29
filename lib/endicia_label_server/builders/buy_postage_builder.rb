require 'ox'

module EndiciaLabelServer
  module Builders
    class BuyPostageBuilder < BuilderBase
      include Ox

      def initialize(opts = {}, root_attributes = nil)
        super('RecreditRequest', opts, root_attributes)
      end

      def post_field
        'recreditRequestXML'
      end
    end
  end
end
