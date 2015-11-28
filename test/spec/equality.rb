require_relative 'spec_init'

describe "Error Data Equality" do
  specify do
    error_data_1 = ErrorData::Controls::ErrorData.example
    error_data_2 = ErrorData::Controls::ErrorData.example

    assert(error_data_1 == error_data_2)
  end
end
