class ErrorData
  class Backtrace < Array
    def to_a
      map do |line|
        line.to_s
      end
    end

    def self.parse(backtrace)
      backtrace.map do |line|
        Line.parse line
      end
    end
  end
end
