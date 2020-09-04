require_relative 'app/concerns/parse_log_file'
require_relative 'app/tasks/entities/log_entity'
require_relative 'app/tasks/queries/log_entities_query'
require_relative 'app/tasks/services/parse_log_service'

# !/usr/local/bin/ruby
puts 'Running application'

class App
  def initialize(args)
    process(args)
  end

  def process(args)
    parse_log_service = Services::ParseLogService.new(args)
    results = parse_log_service.execute

    results.each do |page, views|
      print "#{page} #{views} unique views\n"
    end
  end
end
