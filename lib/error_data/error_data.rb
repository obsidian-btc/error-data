class ErrorData
  include Schema::DataStructure

  attribute :class_name, String
  attribute :message, String
  attribute :stack_trace, Backtrace

  def set_backtrace(backtrace)
    self.stack_trace = Backtrace.parse(backtrace)
  end

  def correspond?(error)
    error_corresponds = class_name == error.class.name &&
      message == error.message

    stack_trace_corresponds = stack_trace.to_a == error.backtrace

    error_corresponds && stack_trace_corresponds
  end
end
