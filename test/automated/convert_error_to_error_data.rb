require_relative 'automated_init'

test "Convert Error to ErrorData" do
  error = Controls::Error.example
  error_data = ErrorData::Convert::Error.(error)
  error_data.correspond? error
end
