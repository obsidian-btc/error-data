class ErrorData
  class Backtrace
    class Frame
      include Schema::DataStructure

      attribute :filename, String
      attribute :line_number, Integer
      attribute :method_name, String

      def to_s
        "#{filename}:#{line_number}:in `#{method_name}'"
      end

      def correspond?(backtrace_text)
        to_s == backtrace_text
      end

      def self.parse(frame_text)
        instance = build

        instance.filename, instance.line_number, instance.method_name = frame_text.split(":")
        instance.method_name = instance.method_name ? instance.method_name.gsub(/^in `(.*?)'$/, "\\1") : "(none)"

        instance
      end
    end
  end
end
