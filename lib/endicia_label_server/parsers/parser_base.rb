require 'uri'
require 'ox'

module EndiciaLabelServer
  module Parsers
    class ParserBase < ::Ox::Sax
      attr_accessor :switches,
                    :status_code,
                    :error_description

      def initialize
        self.switches = {}
      end

      def start_element(name)
        element_tracker_switch name, true
      end

      def end_element(name)
        element_tracker_switch name, false
      end

      def value(value)
        string_value = value.as_s
        self.status_code = string_value if switch_active? :Status
        self.error_description = string_value if switch_active? :ErrorMessage
      end

      def element_tracker_switch(element, currently_in)
        switches[element] = currently_in
      end

      def switch_active?(*elements)
        elements.flatten.all? { |element| switches[element] == true }
      end

      def success?
        ['0', 0].include? status_code
      end
    end
  end
end
