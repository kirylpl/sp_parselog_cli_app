# frozen_string_literal: true

module Services
  # ParseLogService
  class ParseLogService
    include ParseLogFile

    def initialize(args)
      @args = args
    end

    def execute
      raise ArgumentError, 'File path couldnt be blank' if filepath.empty?

      raise 'Wrong file format' unless filepath.include?('log')

      parse_log_file(filepath, log_enities = [])
      raise 'No log entities found' if log_enities.empty?

      Queries::LogEntitiesQuery.call(log_enities)
    end

    private

    def filepath
      @args
    end
  end
end
