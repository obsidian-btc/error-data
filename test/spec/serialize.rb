require_relative 'spec_init'

context "Error Data Serialization" do
  test "Converts to JSON text" do
    compare_json_text = ErrorData::Controls::ErrorData::JSON.text

    error_data = ErrorData::Controls::ErrorData.example
    json_text = Serialize::Write.(error_data, :json)

    assert(json_text == compare_json_text)
  end

  test "Converts to raw data" do
    compare_raw_data = ErrorData::Controls::ErrorData.data

    error_data = ErrorData::Controls::ErrorData.example

    raw_data = Serialize::Write.raw_data(error_data)

    assert(raw_data == compare_raw_data)
  end
end
