# frozen_string_literal: true

require_relative 'app'

App.new(ARGV[0] || 'spec/fixtures/files/webserver.log')
