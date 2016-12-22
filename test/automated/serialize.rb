require_relative 'automated_init'

context "Error Data Serialization" do
  test "Converts to JSON text" do
    control_json_text = Controls::ErrorData::JSON.text

    error_data = Controls::ErrorData.example
    json_text = Transform::Write.(error_data, :json)

    assert(json_text == control_json_text)
  end
end
