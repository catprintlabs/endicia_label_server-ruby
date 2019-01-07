module EndiciaLabelServer
  module Parsers
    class RefundParser < ParserBase
      attr_accessor :error, :requester_id, :request_id, :refund, :form_id, :batch_id

      def initialize
        super

        @refund = {}
      end

      def start_element(name)
        super

        @current_element = name.to_s
      end

      def value(value)
        super

        string_value = value.as_s

        if switch_active? :Refund, :RefundStatus
          @refund[:status] = string_value
        elsif switch_active? :Refund, :RefundStatusMessage
          @refund[:status_message] = string_value
        else
          function_name = "#{underscore(@current_element)}="

          send(function_name, string_value) if respond_to?(function_name)
        end
      end

      def underscore(value)
        value.gsub(/::/, '/')
          .gsub(/([A-Z]+)([A-Z][a-z])/, '\1_\2')
          .gsub(/([a-z\d])([A-Z])/, '\1_\2')
          .tr('-', '_')
          .downcase
      end
    end
  end
end
