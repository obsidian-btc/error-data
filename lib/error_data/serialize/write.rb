class ErrorData
  module Serialize
    module Write
      def self.call(error_data)
        logger.trace "Serializing error data"
        logger.data "ErrorData: #{error_data.inspect}"

        raw_data = raw_data(error_data)

        formatted_data = formatted_data(raw_data)

        json_text = JSON.generate(formatted_data)

        logger.debug "Serialized error data"
        logger.data "ErrorData text: #{json_text}"

        json_text
      end

      def self.raw_data(error_data)
        raw_data = {}

        raw_data = error_data.to_h

        backtrace = []
        error_data.backtrace.each do |line|
          backtrace << line.to_h
        end

        raw_data[:backtrace] = backtrace

        raw_data
      end

      def self.formatted_data(raw_data)
        Casing::Camel.(raw_data)
      end

      def self.logger
        @logger ||= Telemetry::Logger.build self
      end
    end
  end
end
