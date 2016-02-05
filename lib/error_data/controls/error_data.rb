class ErrorData
  module Controls
    module ErrorData
      def self.example
        error_data = ::ErrorData.new
        error_data.class_name = Controls::Error.class_name
        error_data.message = Controls::Error.message

        first_frame = ::ErrorData::Backtrace::Frame.new
        first_frame.line_number = Controls::Error::Backtrace::Frames::First.line_number
        first_frame.filename = Controls::Error::Backtrace::Frames::First.filename
        first_frame.method_name = Controls::Error::Backtrace::Frames::First.method_name

        second_frame = ::ErrorData::Backtrace::Frame.new
        second_frame.line_number = Controls::Error::Backtrace::Frames::Second.line_number
        second_frame.filename = Controls::Error::Backtrace::Frames::Second.filename
        second_frame.method_name = Controls::Error::Backtrace::Frames::Second.method_name

        third_frame = ::ErrorData::Backtrace::Frame.new
        third_frame.line_number = Controls::Error::Backtrace::Frames::Third.line_number
        third_frame.filename = Controls::Error::Backtrace::Frames::Third.filename
        third_frame.method_name = Controls::Error::Backtrace::Frames::Third.method_name

        error_data.backtrace << first_frame
        error_data.backtrace << second_frame
        error_data.backtrace << third_frame

        error_data
      end

      def self.data
        data = {}

        data[:class_name] = Controls::Error.class_name
        data[:message] = Controls::Error.message

        backtrace = [
          {
            :line_number => Controls::Error::Backtrace::Frames::First.line_number,
            :filename => Controls::Error::Backtrace::Frames::First.filename,
            :method_name => Controls::Error::Backtrace::Frames::First.method_name
          },
          {
            :line_number => Controls::Error::Backtrace::Frames::Second.line_number,
            :filename => Controls::Error::Backtrace::Frames::Second.filename,
            :method_name => Controls::Error::Backtrace::Frames::Second.method_name
          },
          {
            :line_number => Controls::Error::Backtrace::Frames::Third.line_number,
            :filename => Controls::Error::Backtrace::Frames::Third.filename,
            :method_name => Controls::Error::Backtrace::Frames::Third.method_name
          }
        ]

        data[:backtrace] = backtrace

        data
      end

      module JSON
        def self.text
          ::JSON.generate(data)
        end

        def self.data
          {
            'className' => Controls::Error.class_name,
            'message' => Controls::Error.message,
            'backtrace' => Backtrace.data
          }
        end

        module Backtrace
          def self.data
            [
              Frames::First.data,
              Frames::Second.data,
              Frames::Third.data
            ]
          end

          module Frames
            module First
              def self.data
                {
                  'filename' => Controls::Error::Backtrace::Frames::First.filename,
                  'lineNumber' => Controls::Error::Backtrace::Frames::First.line_number,
                  'methodName' => Controls::Error::Backtrace::Frames::First.method_name
                }
              end
            end

            module Second
              def self.data
                {
                  'filename' => Controls::Error::Backtrace::Frames::Second.filename,
                  'lineNumber' => Controls::Error::Backtrace::Frames::Second.line_number,
                  'methodName' => Controls::Error::Backtrace::Frames::Second.method_name
                }
              end
            end

            module Third
              def self.data
                {
                  'filename' => Controls::Error::Backtrace::Frames::Third.filename,
                  'lineNumber' => Controls::Error::Backtrace::Frames::Third.line_number,
                  'methodName' => Controls::Error::Backtrace::Frames::Third.method_name
                }
              end
            end
          end
        end
      end
    end
  end
end
