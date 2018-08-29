require 'ox'

module EndiciaLabelServer
  module Builders
    # The {UserSignUpBuilder} class builds Endicia XML Rate Objects.
    #
    # @author Paul Trippett
    # @since 0.1.0
    class UserSignUpBuilder < BuilderBase
      include Ox

      # Initializes a new {RateBuilder} object
      #
      def initialize(opts = {}, root_attributes = nil)
        super('UserSignUpRequest', opts, root_attributes)
        root[:TokenRequested] = 'true'
      end

      def post_field
        'UserSignUpRequestXML'
      end
    end
  end
end
