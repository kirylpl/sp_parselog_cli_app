# frozen_string_literal: true

# Class to validate filepath and file format
class FileValidator
  VALID_FILE_FORMATS = %w[.log .txt].freeze

  def initialize(filepath)
    @filepath = filepath
  end

  def validate
    raise ArgumentError, 'File filepath couldnt be blank' if !@filepath || @filepath.empty?
    raise WrongFileFormat, 'Wrong file format' unless VALID_FILE_FORMATS.include? File.extname(@filepath)
  end
end
