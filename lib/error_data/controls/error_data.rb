class ErrorData
  module Controls
    module ErrorData
      def self.example
        error_data = ::ErrorData.new
        error_data.class_name = Controls::Error.class_name
        error_data.message = Controls::Error.message

        first_stack_frame = ::ErrorData::StackFrame.new
        first_stack_frame.line_number = Controls::Error::Backtrace::Frames::First.line_number
        first_stack_frame.filename = Controls::Error::Backtrace::Frames::First.filename
        first_stack_frame.method_name = Controls::Error::Backtrace::Frames::First.method_name

        second_stack_frame = ::ErrorData::StackFrame.new
        second_stack_frame.line_number = Controls::Error::Backtrace::Frames::Second.line_number
        second_stack_frame.filename = Controls::Error::Backtrace::Frames::Second.filename
        second_stack_frame.method_name = Controls::Error::Backtrace::Frames::Second.method_name

        third_stack_frame = ::ErrorData::StackFrame.new
        third_stack_frame.line_number = Controls::Error::Backtrace::Frames::Third.line_number
        third_stack_frame.filename = Controls::Error::Backtrace::Frames::Third.filename
        third_stack_frame.method_name = Controls::Error::Backtrace::Frames::Third.method_name

        stack_frames = []
        stack_frames << first_stack_frame
        stack_frames << second_stack_frame
        stack_frames << third_stack_frame

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
            'stackTrace' => StackTrace.data
          }
        end

        module StackTrace
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
                  'lineNumber' => Controls::Error::Backtrace::Frames::First.line_number,
                  'fileName' => Controls::Error::Backtrace::Frames::First.filename,
                  'methodName' => Controls::Error::Backtrace::Frames::First.method_name
                }
              end
            end

            module Second
              def self.data
                {
                  'lineNumber' => Controls::Error::Backtrace::Frames::Second.line_number,
                  'fileName' => Controls::Error::Backtrace::Frames::Second.filename,
                  'methodName' => Controls::Error::Backtrace::Frames::Second.method_name
                }
              end
            end

            module Third
              def self.data
                {
                  'lineNumber' => Controls::Error::Backtrace::Frames::Third.line_number,
                  'fileName' => Controls::Error::Backtrace::Frames::Third.filename,
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
