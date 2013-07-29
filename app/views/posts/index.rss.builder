# index.rss.builder
xml.instruct! :xml, :version => "1.0" 
xml.rss :version => "2.0" do
  xml.channel do
    xml.title  '.blindness.'
    xml.description "blasts of erratic posts, a side project of icewhistle.com"
    xml.link posts_url(:format => :rss)

    for article in @posts
      xml.item do
        xml.title article.title
        xml.description  render :partial => 'posts/type' + article.the_type.to_s + ".html", :locals => {:post => article , :notitle => true}
        xml.pubDate article.created_at.to_s(:rfc822)
        xml.link post_url(article)
        xml.guid post_url(article)
      end
    end
  end
end

