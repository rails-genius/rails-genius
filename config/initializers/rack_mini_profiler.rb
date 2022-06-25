# frozen_string_literal: true

# configure miniprofiler only for development
if defined? Rack::MiniProfiler
  Rack::MiniProfiler.config.position = 'bottom-right'
end
