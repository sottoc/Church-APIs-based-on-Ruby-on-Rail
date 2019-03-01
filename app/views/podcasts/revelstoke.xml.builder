title = "C3 Church Revelstoke"
author = "C3 Church"
email = 'podcast@c3church.ca'
description = "We hope you enjoy the latest messages from C3 Church"
keywords = "church, christianity, C3 Church, revelstoke, BC, sermon, personal development"
image = image_url('revelstoke-itunes.png')

xml.instruct! :xml, version: "1.0"
xml.rss "xmlns:itunes" => "http://www.itunes.com/dtds/podcast-1.0.dtd",  "xmlns:media" => "http://search.yahoo.com/mrss/",  version: "2.0" do
  xml.channel do
    xml.title title
    xml.link 'http://c3church.ca'
    xml.description description
    xml.language 'en-us'
    xml.pubDate @podcasts.first.created_at.to_s(:rfc822)
    xml.lastBuildDate @podcasts.first.created_at.to_s(:rfc822)
    xml.itunes :author, author
    xml.itunes :keywords, keywords
    xml.itunes :image, :href => image
    xml.itunes :owner do
      xml.itunes :name, author
      xml.itunes :email, email
    end
    xml.itunes :block, 'no'
    xml.itunes :category, text: 'Religion & Spirituality' do
      xml.itunes :category, text: 'Christianity'
    end
    xml.itunes :explicit, 'no'    

    @podcasts.each do  |podcast|
      xml.item do
        xml.title podcast.title + ' - ' + podcast.author
        xml.description podcast.description
        xml.pubDate podcast.dateof.to_s(:rfc822)
        xml.enclosure :url => podcast.podcast_file_path, :type => 'audio/mpeg', :length => podcast.podcast_size
        xml.link podcast_url(podcast) # , :type => podcast.movie_type, :length => podcast.movie_size
        xml.guid({:isPermaLink => "false"}, podcast_url(podcast))
        xml.itunes :summary, strip_tags(podcast.description).gsub('&#8217;',"'")
        xml.itunes :explicit, 'no'
 #       xml.itunes :duration, podcast.movie_duration.strip
        # xml.itunes :author, author
      end
    end
  end
end
