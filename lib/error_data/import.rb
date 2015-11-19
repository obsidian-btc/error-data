class ErrorData
  class Import
    attr_reader :error

    def initialize(error)
      @error = error
    end

    def self.build(error)
      new error
    end

    def self.call(error)
      instance = self.build error
      instance.()
    end

    def call
      error_data = ErrorData.build

      error_data.class_name = error.class.name
      error_data.message = error.message
      error_data.set_backtrace(error.backtrace)

      error_data
    end
  end
end
