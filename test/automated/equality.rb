require_relative 'automated_init'

context "Error Data Equality" do
  test "When attributes are equal" do
    error_data_1 = Controls::ErrorData.example
    error_data_2 = Controls::ErrorData.example

    assert(error_data_1 == error_data_2)
  end
end
