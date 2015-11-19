class ErrorData
  class Backtrace < Array
    class Line
      include Schema::DataStructure

      attribute :filename, String
      attribute :line_number, Integer
      attribute :method_name, String

      def to_s
        "#{filename}:#{line_number}:in `#{method_name}'"
      end

      def correspond?(backtrace_line)
        to_s == backtrace_line
      end

      def self.parse(line)
        instance = build

        instance.filename, instance.line_number, instance.method_name = line.split(":")
        instance.method_name = instance.method_name ? instance.method_name.gsub(/^in `(.*?)'$/, "\\1") : "(none)"

        instance
      end
    end
  end
end
