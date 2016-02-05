require_relative 'spec_init'

test "Convert Error to ErrorData" do
  error = ErrorData::Controls::Error.example
  error_data = ErrorData::Import.(error)
  error_data.correspond? error
end
