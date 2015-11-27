require_relative 'spec_init'

describe "Error Data Deserialization" do
  specify "Converts from JSON text" do
    compare_error_data = ErrorData::Controls::ErrorData.example

    json_text = ErrorData::Controls::ErrorData::JSON.text

    error_data = Serialize::Read.(json_text, :json)

    assert(error_data == compare_error_data)
  end
end
