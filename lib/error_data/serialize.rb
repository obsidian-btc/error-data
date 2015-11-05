class ErrorData
  class Serialize
    attr_reader :error_data

    def initialize(error_data)
      @error_data = error_data
    end

    def self.build(error_data)
      new error_data
    end

    def self.call(error_data)
      instance = self.build error_data
      instance.()
    end

    def call
      ::JSON.generate(json_formatted_data)
    end

    def json_formatted_data
      data = {}
      data[:class_name] = error_data.class_name
      data[:message] = error_data.message

      stack_trace = []
      error_data.stack_trace.each do |stack_frame|
        frame = {}
        frame[:line_number] = stack_frame.line_number
        frame[:file_name] = stack_frame.filename
        frame[:method_name] = stack_frame.method_name
        stack_trace << frame
      end

      data[:stack_trace] = stack_trace

      json_data = Casing::Camel.(data)

      json_data
    end
  end
end
