# news_archive.rss.builder
xml.instruct! :xml, :version => "1.0" 
xml.rss :version => "2.0" do
  xml.channel do
    xml.title "Pizzatown.ca News"
    xml.description "News and Events from Pizzatown.ca"
    xml.link about_news_archive_url()
    
    for post in @posts
      xml.item do
        xml.title post.title
        xml.description textilize(post.body)
        xml.pubDate post.created_at.to_s(:rfc822)
        xml.link about_news_view_url(post)
        xml.guid about_news_view_url(post)
      end
    end
  end
end