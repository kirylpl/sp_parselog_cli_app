# frozen_string_literal: true

# Effectively reading file
module FileReader
  private

  # Automatically closing a file using a block
  # Process a file sequentially, lines loaded into memory not at the same time.
  def file_each_line(filepath)
    File.open(filepath).each do |line|
      next if line.empty?

      yield(line)
    end
  end
end
