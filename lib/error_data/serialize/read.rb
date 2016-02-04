class ErrorData
  module Serialize
    module Read
      def self.call(text)
        logger.trace "Deserializing error data"
        logger.data "ErrorData text: #{text}"

        formatted_data = formatted_data(text)

        raw_data = raw_data(formatted_data)

        error_data = build(raw_data)

        logger.debug "Deserialized error data"
        logger.data "ErrorData: #{error_data.inspect}"

        error_data
      end

      def self.formatted_data(text)
        JSON.parse(text)
      end

      def self.raw_data(formatted_data)
        Casing::Underscore.(formatted_data)
      end

      def self.build(raw_data)
        error_data = ErrorData.build(raw_data)

        error_data.backtrace = Backtrace.build(raw_data['backtrace'])

        error_data
      end

      def self.logger
        @logger ||= Telemetry::Logger.build self
      end
    end
  end
end
