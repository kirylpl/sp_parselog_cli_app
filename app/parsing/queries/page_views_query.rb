# frozen_string_literal: true

# page views counting and adding into array
class PageViewsQuery
  attr_reader :pages, :page_url

  def initialize(pages, page_url)
    @pages = pages
    @page_url = page_url
  end

  def calculate
    page = find_or_create_page
    page.increment
  end

  private

  def find_or_create_page
    find_page || create_page
  end

  def find_page
    pages.find { |page| page.page_url == page_url }
  end

  def create_page
    new_page = Entities::WeblogPage.new(page_url, 0)
    pages << new_page
    new_page
  end
end
