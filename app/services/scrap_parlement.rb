require 'nokogiri'
require 'open-uri'

class ScrapParlement
  attr_accessor :depute_list, :mailing_list

  def initialize
    @depute_list = []
    @mailing_list = {}
  end

  def get_depute_list
    p '-' * 20 + 'starting the search for all the deputes' + '-' * 20
    doc = Nokogiri::HTML(open("https://www.nosdeputes.fr/deputes"))
    p '-' * 20 + 'Nokogiri opened the page correctly' + '-' * 20
    doc.xpath('//td/a').each do |node|
      @depute_list << node['href']
      p node['href']
    end
    p '-' * 20 + 'everything went well' + '-' * 20
  end

  def deputes_infos_list
    p '-' * 20 + 'starting the search for all the infos' + '-' * 20
    @depute_list.each do |url|

      url = "https://www.nosdeputes.fr#{url}"
      doc = Nokogiri::HTML(open("#{url}"))
      p '-' * 20 + 'Nokogiri opened the page correctly' + '-' * 20
      names = doc.xpath('//h1').text
      emails = doc.xpath('/html/body/div[1]/div[5]/div/div[2]/div[1]/ul[2]/li[1]/ul/li[1]/a').text
      @mailing_list << hash
    end
  end

  def save

  end

  def perform
    get_depute_list
  end
end
