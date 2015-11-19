class ErrorData
  module Controls
    module ErrorData
      def self.example
        error_data = ::ErrorData.new
        error_data.class_name = Controls::Error.class_name
        error_data.message = Controls::Error.message

        first_line = ::ErrorData::Backtrace::Line.new
        first_line.line_number = Controls::Error::Backtrace::Lines::First.line_number
        first_line.filename = Controls::Error::Backtrace::Lines::First.filename
        first_line.method_name = Controls::Error::Backtrace::Lines::First.method_name

        second_line = ::ErrorData::Backtrace::Line.new
        second_line.line_number = Controls::Error::Backtrace::Lines::Second.line_number
        second_line.filename = Controls::Error::Backtrace::Lines::Second.filename
        second_line.method_name = Controls::Error::Backtrace::Lines::Second.method_name

        third_line = ::ErrorData::Backtrace::Line.new
        third_line.line_number = Controls::Error::Backtrace::Lines::Third.line_number
        third_line.filename = Controls::Error::Backtrace::Lines::Third.filename
        third_line.method_name = Controls::Error::Backtrace::Lines::Third.method_name

        stack_frames = []
        stack_frames << first_line
        stack_frames << second_line
        stack_frames << third_line

        error_data.stack_trace = stack_frames

        error_data
      end

      module JSON
        def self.text
          ::JSON.generate(data)
        end

        def self.data
          {
            'className' => Controls::Error.class_name,
            'message' => Controls::Error.message,
            'stackTrace' => Backtrace.data
          }
        end

        module Backtrace
          def self.data
            [
              Lines::First.data,
              Lines::Second.data,
              Lines::Third.data
            ]
          end

          module Lines
            module First
              def self.data
                {
                  'lineNumber' => Controls::Error::Backtrace::Lines::First.line_number,
                  'fileName' => Controls::Error::Backtrace::Lines::First.filename,
                  'methodName' => Controls::Error::Backtrace::Lines::First.method_name
                }
              end
            end

            module Second
              def self.data
                {
                  'lineNumber' => Controls::Error::Backtrace::Lines::Second.line_number,
                  'fileName' => Controls::Error::Backtrace::Lines::Second.filename,
                  'methodName' => Controls::Error::Backtrace::Lines::Second.method_name
                }
              end
            end

            module Third
              def self.data
                {
                  'lineNumber' => Controls::Error::Backtrace::Lines::Third.line_number,
                  'fileName' => Controls::Error::Backtrace::Lines::Third.filename,
                  'methodName' => Controls::Error::Backtrace::Lines::Third.method_name
                }
              end
            end
          end
        end
      end
    end
  end
end
