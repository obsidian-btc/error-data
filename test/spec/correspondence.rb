require_relative 'spec_init'

describe "Error Data Correspondence with Error" do
  specify do
    error = ErrorData::Controls::Error.example
    error_data = ErrorData::Controls::ErrorData.example

    assert(error_data.correspond? error)
  end
end
