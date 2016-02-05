require_relative 'bench_init'

context "Error Data Deserialization" do
  test "Converts from JSON text" do
    compare_error_data = ErrorData::Controls::ErrorData.example

    json_text = ErrorData::Controls::ErrorData::JSON.text

    error_data = Serialize::Read.(json_text, compare_error_data.class, :json)

    assert(error_data == compare_error_data)
  end

  test "Converts from raw data" do
    compare_error_data = ErrorData::Controls::ErrorData.example

    raw_data = ErrorData::Controls::ErrorData.data

    error_data = Serialize::Read.instance(raw_data, compare_error_data.class)

    assert(error_data == compare_error_data)
  end
end
