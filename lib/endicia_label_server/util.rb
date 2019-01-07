module EndiciaLabelServer
  module Util
    class << self
      def camelize(value, ignore_exception = false)
        value.to_s.split('_').map do |v|
          ignore_exception ? v.capitalize : capitalize_with_id_exception(v)
        end.join
      end

      def capitalize_with_id_exception(value)
        (value == 'id') ? 'ID' : value.capitalize
      end

      def singularize(word)
        if word =~ /([a-zA-Z]+?)(s\b|\b)/i
          return $1
        else
          return word
        end
      end

      def underscore(word)
        word.gsub(/::/, '/').
          gsub(/([A-Z]+)([A-Z][a-z])/,'\1_\2').
          gsub(/([a-z\d])([A-Z])/,'\1_\2').
          tr("-", "_").
          downcase
      end
    end
  end
end
