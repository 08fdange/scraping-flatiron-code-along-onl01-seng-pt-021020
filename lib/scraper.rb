require 'nokogiri'
require 'open-uri'

require_relative './course.rb'

class Scraper
  
  def get_page
    url = open("http://learn-co-curriculum.github.io/site-for-scraping/courses")
    doc = Nokogiri::HTML(url)
  end
  
  def get_courses
    self.get_page.css(".post")
  end
  
  def make_courses
    self.get_courses.each do |course|
      self.title = course.css("#h2").text
      class.schedule = course.css(".date").text
      class.description = course.css("#p").text
    end
  end
  
  def print_courses
    self.make_courses
    Course.all.each do |course|
      if course.title && course.title != ""
        puts "Title: #{course.title}"
        puts "  Schedule: #{course.schedule}"
        puts "  Description: #{course.description}"
      end
    end
  end
  
end



