module EndiciaLabelServer
  module Parsers
    class GetAccountStatusParser < ParserBase
      attr_accessor :requester_id, :request_id, :certified_intermediary, :account_type,
                    :approved_shipper, :consolidator_services, :insurance_agreement,
                    :control_register, :account_features

      def initialize
        super

        @certified_intermediary = {}
      end

      def value(value)
        super

        string_value = value.as_s

        if switch_active? :RequesterID
          self.requester_id = string_value
        elsif switch_active? :RequestID
          self.request_id = string_value
        elsif switch_active? :Token
          self.token = string_value
        elsif switch_active? :CertifiedIntermediary, :AccountID
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
        elsif switch_active? :AccountType
          self.account_type = string_value
        elsif switch_active? :ApprovedShipper
          self.approved_shipper = string_value
        elsif switch_active? :ConsolidatorServices
          self.consolidator_services = string_value
        elsif switch_active? :InsuranceAgreement
          self.insurance_agreement = string_value
        elsif switch_active? :ControlRegister
          self.control_register = string_value
        elsif switch_active? :AccountFeatures
          self.account_features = string_value
        end
      end

      def parse_certified_intermediary(key, value)
        @certified_intermediary[key] = value
      end
    end
  end
end
