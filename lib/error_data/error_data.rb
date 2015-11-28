class ErrorData
  include Schema::DataStructure

  attribute :class_name, String
  attribute :message, String
  attribute :backtrace, Backtrace

  def set_backtrace(backtrace)
    self.backtrace = Backtrace.parse(backtrace)
  end

  def correspond?(error)
    error_corresponds = class_name == error.class.name &&
      message == error.message

    backtrace_corresponds = backtrace.to_a == error.backtrace

    error_corresponds && backtrace_corresponds
  end

  def ==(other)
    return false if self.class != other.class

    this_hash = Serialize::Write.raw_data self
    other_hash = Serialize::Write.raw_data other

    this_hash == other_hash
  end

  module Serializer
    def self.json
      JSON
    end

    module JSON
      def self.write(error_data)
        ErrorData::Serialize::Write.(error_data)
      end

      def self.read(text)
        ErrorData::Serialize::Read.(text)
      end
    end
  end
end
