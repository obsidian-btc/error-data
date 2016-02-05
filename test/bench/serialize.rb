require_relative 'bench_init'

context "Error Data Serialization" do
  test "Converts to JSON text" do
    control_json_text = ErrorData::Controls::ErrorData::JSON.text

    error_data = ErrorData::Controls::ErrorData.example
    json_text = Serialize::Write.(error_data, :json)

    assert(json_text == control_json_text)
  end

  test "Converts to raw data" do
    control_raw_data = ErrorData::Controls::ErrorData.data

    error_data = ErrorData::Controls::ErrorData.example

    raw_data = Serialize::Write.raw_data(error_data)

    assert(raw_data == control_raw_data)
  end
end
