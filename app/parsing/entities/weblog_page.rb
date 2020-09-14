# frozen_string_literal: true

module Entities
  # Struct to save weblog page entity with page views number
  WeblogPage = Struct.new(:page_url, :views_number) do
    def increment
      self.views_number += 1
    end
  end
end
