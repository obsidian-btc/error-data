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

      backtrace = []
      error_data.backtrace.each do |line|
        line_info = {}
        line_info[:line_number] = line.line_number
        line_info[:file_name] = line.filename
        line_info[:method_name] = line.method_name
        backtrace << line_info
      end

      data[:stack_trace] = backtrace

      json_data = Casing::Camel.(data)

      json_data
    end
  end
end
