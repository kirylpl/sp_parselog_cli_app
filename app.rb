# frozen_string_literal: true

require 'require_all'
require_all 'app'

# !/usr/local/bin/ruby
puts 'Running application'

# Weblog parser App
class App
  def initialize(filepath)
    @filepath = filepath
  end

  def run
    results = FileParser.new(@filepath).parse
    results.each do |page|
      print "#{page.page_url} #{page.views_number} unique views\n"
    end
  rescue StandardError => e
    print "Error: #{e.message}"
  end
end
