class ErrorData
  module Transformer
    def self.json
      JSON
    end

    def self.instance(raw_data)
      ErrorData.build(raw_data)
    end

    def self.raw_data(instance)
      instance.to_h
    end

    module JSON
      def self.read(text)
        formatted_data = ::JSON.parse(text, symbolize_names: true)
        Casing::Underscore.(formatted_data)
      end

      def self.write(raw_data)
        formatted_data = Casing::Camel.(raw_data)
        ::JSON.generate(formatted_data)
      end
    end
  end
end
