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
      p doc.xpath('//h1').text
      p doc.xpath('/html/body/div[1]/div[5]/div/div[2]/div[1]/ul[2]/li[1]/ul/li[1]/a').text
      @mailing_list["#{doc.xpath('//h1').text}"] = doc.xpath('/html/body/div[1]/div[5]/div/div[2]/div[1]/ul[2]/li[1]/ul/li[1]/a').text
    end
    p @mailing_list
    p '-' * 20 + 'Scrapping of the mailing list : done' + '-' * 20
  end

  def save
    p '-' * 20 + 'wiping de la table deputes' + '-' * 20
    Depute.destroy_all
    p '-' * 20 + 'stockage de la mailing list dans la db' + '-' * 20
    @mailing_list.each do |key, value|
      p '-' * 20 + 'passage dans le hash' + '-' * 20
      mailing_save = Depute.create(name: key, email: value)
      p mailing_save
    end
    p '-' * 20 + 'stockage de la mailig list réussis' + '-' * 20
  end

  def self.perform
    actions = ScrapParlement.new
    actions.get_depute_list
    actions.deputes_infos_list
    actions.save
  end
end
