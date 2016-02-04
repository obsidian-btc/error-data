class ErrorData
  class Backtrace < Array
    def lines
      @lines ||= []
    end

    def self.build(data)
      new.tap do |instance|
        data.each do |line|
          instance.lines << Line.build(line)
        end
      end
    end

    def add_line(line)
      lines << line
    end
    alias :<< :add_line

    def each(&blk)
      lines.each &blk
    end

    def to_a
      lines.map do |line|
        line.to_s
      end
    end

    def self.parse(backtrace)
      instance = new

      backtrace.each do |line|
        instance.add_line(Line.parse(line))
      end

      instance
    end
  end
end
