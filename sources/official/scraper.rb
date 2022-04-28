#!/bin/env ruby
# frozen_string_literal: true

require 'every_politician_scraper/scraper_data'
require 'pry'

class MemberList
  class Member
    def name
      noko.css('h2,h4').text.tidy.delete_prefix('H.E. ')
    end

    def position
      noko.css('h5').text.tidy
    end

    def empty?
      name.empty?
    end
  end

  class Members
    def member_items
      super.reject(&:empty?)
    end

    def member_container
      noko.css('.elementor-element')
    end
  end
end

file = Pathname.new 'official.html'
puts EveryPoliticianScraper::FileData.new(file).csv
