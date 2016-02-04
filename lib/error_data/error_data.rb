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

    def self.read(raw_data)
      ErrorData.build(raw_data)
    end

    module JSON
      module Write
        def self.call(error_data)
          ErrorData::Serialize::Write.(error_data)
        end

        def self.raw_data(error_data)
          ErrorData::Serialize::Write.raw_data(error_data)
        end
      end

      module Read
        def self.call(text)
          ErrorData::Serialize::Read.(text)
        end

        def self.raw_data(formatted_data)
          ErrorData::Serialize::Read.raw_data(formatted_data)
        end
      end
    end
  end
end
