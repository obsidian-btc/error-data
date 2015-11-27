class ErrorData
  module Serialize
    module Write
      def self.call(error_data)
        raw_data = raw_data(error_data)

        formatted_data = formatted_data(raw_data)

        json_text = JSON.generate(formatted_data)

        json_text
      end
    end
  end
end
