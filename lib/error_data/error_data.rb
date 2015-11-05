class ErrorData
  include Schema::DataStructure

  class StackFrame
    include Schema::DataStructure

    attribute :line_number, Integer
    attribute :filename, String
    attribute :method_name, String
  end

  attribute :class_name, String
  attribute :message, String
  attribute :stack_trace, Array[StackFrame]
end
