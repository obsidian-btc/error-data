class ErrorData
  module Serialize
    module Read
      def self.call(text)
        formatted_data = formatted_data(text)

        raw_data = raw_data(formatted_data)

        build_error_data(raw_data)
      end

      def self.formatted_data(text)
        JSON.parse(text)
      end

      def self.raw_data(formatted_data)
        Casing::Underscore.(formatted_data)
      end

      def self.build_error_data(raw_data)
        error_data = ErrorData.build(raw_data)

        error_data.backtrace = Backtrace.build(raw_data['backtrace'])

        error_data
      end
    end
  end
end
