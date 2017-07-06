require 'nokogiri'
require 'open-uri'


  def get_page
    html = open("./fixtures/kickstarter.html")
    doc = Nokogiri::HTML(html)    
  end
  def get_projects
    doc = get_page
    doc.css(".project-card")
  end

def create_project_hash
  hash = {}
  get_projects.each do |project|
    title = project.css(".bbcard_name").css("strong").css("a").text
    hash[title] = {
      :image_link => project.css(".project-thumbnail").css("a").css(".projectphoto-little").css("img")[0].attributes["src"].value, #.text,
      :description => project.css(".bbcard_blurb").text,
      :location => project.css(".project-stats").css("li")[0].css("strong").text.gsub("%", ""),
      :percent_funded => 10
    }
  end
  # write your code here
  hash
end