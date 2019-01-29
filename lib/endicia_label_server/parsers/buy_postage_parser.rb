module EndiciaLabelServer
  module Parsers
    class BuyPostageParser < ParserBase
      attr_accessor :status, :error, :certified_intermediary, :transaction_id, :control_register

      def initialize
        super

        @certified_intermediary = {}
      end

      def start_element(name)
        super

        @current_element = name.to_s
      end

      def value(value)
        super

        string_value = value.as_s

        if switch_active? :CertifiedIntermediary, :AccountID
          parse_certified_intermediary(:account_id, string_value)
        elsif switch_active? :CertifiedIntermediary, :SerialNumber
          parse_certified_intermediary(:serial_number, string_value)
        elsif switch_active? :CertifiedIntermediary, :PostageBalance
          parse_certified_intermediary(:postage_balance, string_value)
        elsif switch_active? :CertifiedIntermediary, :AscendingBalance
          parse_certified_intermediary(:ascending_balance, string_value)
        elsif switch_active? :CertifiedIntermediary, :AccountStatus
          parse_certified_intermediary(:account_status, string_value)
        elsif switch_active? :CertifiedIntermediary, :DeviceID
          parse_certified_intermediary(:device_id, string_value)
        elsif switch_active? :CertifiedIntermediary, :ReferenceID
          parse_certified_intermediary(:reference_id, string_value)
        else
          function_name = "#{underscore(@current_element)}="

          send(function_name, string_value) if respond_to?(function_name)
        end
      end

      def parse_certified_intermediary(key, value)
        @certified_intermediary[key] = value
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
