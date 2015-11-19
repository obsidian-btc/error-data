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
  end

  attribute :class_name, String
  attribute :message, String
  attribute :stack_trace, Array[StackFrame]

  def backtrace
    stack_trace.map do |stack_frame|
      stack_frame.to_s
    end
  end

  def correspond?(error)
    error_corresponds = class_name == error.class.name &&
      message == error.message

    stack_trace_corresponds = true
    stack_trace.each_with_index do |stack_frame, i|
      unless stack_frame.correspond?(error.backtrace[i])
        stack_trace_corresponds = false
        break
      end
    end

    error_corresponds && stack_trace_corresponds
  end
end
