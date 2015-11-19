class ErrorData
  include Schema::DataStructure

  class StackFrame
    include Schema::DataStructure

    attribute :filename, String
    attribute :line_number, Integer
    attribute :method_name, String

    def to_s
      "#{filename}:#{line_number}:in `#{method_name}'"
    end

    def correspond?(backtrace_line)
      to_s == backtrace_line
    end

    def self.parse(line)
      instance = build

      instance.filename, instance.line_number, instance.method_name = line.split(":")
      instance.method_name = instance.method_name ? instance.method_name.gsub(/^in `(.*?)'$/, "\\1") : "(none)"

      instance
    end
  end

  attribute :class_name, String
  attribute :message, String
  attribute :stack_trace, Array[StackFrame]

  def backtrace
    stack_trace.map do |stack_frame|
      stack_frame.to_s
    end
  end

  def parse_backtrace(backtrace)
    backtrace.map do |line|
      StackFrame.parse line
    end
  end

  def set_backtrace(backtrace)
    self.stack_trace = parse_backtrace(backtrace)
  end

  def correspond?(error)
    error_corresponds = class_name == error.class.name &&
      message == error.message

    stack_trace_corresponds = backtrace == error.backtrace

    error_corresponds && stack_trace_corresponds
  end
end
