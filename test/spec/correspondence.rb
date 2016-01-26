require_relative 'spec_init'

context "Error Data Correspondence with Error" do
  test do
    error = ErrorData::Controls::Error.example
    error_data = ErrorData::Controls::ErrorData.example

    assert(error_data.correspond? error)
  end
end
