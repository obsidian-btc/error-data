require_relative 'automated_init'

context "Error Data Correspondence with Error" do
  test "When attributes correspond" do
    error = Controls::Error.example
    error_data = Controls::ErrorData.example

    assert(error_data.correspond? error)
  end
end
