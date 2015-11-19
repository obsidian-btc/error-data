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
      ErrorData.new
    end
  end
end
