ENV['CONSOLE_DEVICE'] ||= 'stdout'
ENV['LOG_LEVEL'] ||= '_min'

ENV['ENTITY_CACHE_SCOPE'] ||= 'exclusive'

require_relative '../init.rb'

require 'error_data/controls'

require 'pp'
require 'transform'

Controls = ErrorData::Controls
