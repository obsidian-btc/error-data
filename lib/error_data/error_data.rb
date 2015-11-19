class ErrorData
  include Schema::DataStructure

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
