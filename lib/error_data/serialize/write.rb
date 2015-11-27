class ErrorData
  module Serialize
    module Write
      def self.call(error_data)
        raw_data = raw_data(error_data)

        json_formatted_data = Casing::Camel.(raw_data)

        json_text = JSON.generate(json_formatted_data)

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
    end
  end
end
