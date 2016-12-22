class ErrorData
  include Schema::DataStructure

  attribute :class_name, String
  attribute :message, String
  attribute :backtrace, Backtrace

  def backtrace
    @backtrace ||= Backtrace.new
  end

  def self.build(data=nil)
    backtrace = data.delete :backtrace if data

    instance = super
    instance.backtrace = Backtrace.build(backtrace) if backtrace
    instance
  end

  def set_backtrace(backtrace)
    self.backtrace = Backtrace.parse(backtrace)
  end

  def correspond?(error)
    error_corresponds = class_name == error.class.name &&
      message == error.message

    backtrace_corresponds = backtrace.text_frames == error.backtrace

    error_corresponds && backtrace_corresponds
  end

  def ==(other)
    return false if self.class != other.class

    this_hash = Transform::Write.raw_data self
    other_hash = Transform::Write.raw_data other

    this_hash == other_hash
  end

  def to_h
    data = attributes
    data[:backtrace] = backtrace.to_a
    data
  end
end
