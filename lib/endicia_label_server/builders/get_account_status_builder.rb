require 'ox'

module EndiciaLabelServer
  module Builders
    class GetAccountStatusBuilder < BuilderBase
      include Ox

      def initialize(opts = {}, root_attributes = nil)
        super('AccountStatusRequest', opts, root_attributes)
      end

      def post_field
        'AccountStatusRequestXML'
      end
    end
  end
end