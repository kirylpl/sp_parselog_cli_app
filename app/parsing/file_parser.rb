# frozen_string_literal: true

# File parser wrapper class, to parse different kind of files
class FileParser
  attr_reader :filepath, :parser

  def initialize(filepath, parser = WebLogParser.new)
    @filepath = filepath
    @parser = parser
  end

  def parse
    FileValidator.new(filepath).validate
    parser.parse(filepath)
  end
end
