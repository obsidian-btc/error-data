class ErrorData
  class Backtrace < Array
    def self.build(data)
      new.tap do |instance|
        data.each do |line|
          instance << Line.build(line)
        end
      end
    end

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
