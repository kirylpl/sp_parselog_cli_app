# frozen_string_literal: true

# Parsing log files specifically
class WebLogParser
  include FileReader
  def parse(filepath, pages = [])
    file_each_line(filepath) do |line|
      page, _ip = line.strip.split(' ')
      next if page&.empty? && !page&.include?('/')

      PageViewsQuery.new(pages, page).calculate
    end
    raise 'No log entities found' if pages.empty?

    pages.sort_by(&:views_number).reverse
  end
end
