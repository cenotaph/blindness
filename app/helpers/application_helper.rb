module ApplicationHelper
 
  
  def figure_sound_type(sound)
    if sound.url =~ /www\.goear\.com\//  # is goear
      
      id = sound.url.match(/\/listen\/(.+)\//)[1]

      return '<object width="353" height="132"><embed src="http://www.goear.com/files/external.swf?file=' + id + '"  type="application/x-shockwave-flash" wmode="transparent" quality="high" width="353" height="132"></embed></object>'
    end
  end
  
  def figure_video_type(video)
    if video.url =~ /youtube\.com/ # it's youtube
      return auto_html(video.url) { youtube(:width => 800, :height => 600)}
      # video.url.gsub!(/watch\?v\=/, 'v/')
      # return '<object width="425" height="344"><param name="movie" value="' + video.url + '&color1=0xb1b1b1&color2=0xcfcfcf&feature=player_embedded&fs=1"></param><param name="allowFullScreen" value="true"></param><embed src="' + video.url + '&color1=0xb1b1b1&color2=0xcfcfcf&feature=player_embedded&fs=1" type="application/x-shockwave-flash" allowfullscreen="true" width="425" height="344"></embed></object>'
    elsif video.url =~ /vimeo\.com/ 
      return auto_html(video.url) { vimeo(:width => 800, :height => 600)}
       # url = video.url.match(/\.com\/(\d+)/)[1]
        # return '<object width="400" height="300"><param name="allowfullscreen" value="true" /><param name="allowscriptaccess" value="always" /><param name="movie" value="http://vimeo.com/moogaloop.swf?clip_id=' + url + '&amp;server=vimeo.com&amp;show_title=1&amp;show_byline=1&amp;show_portrait=0&amp;color=&amp;fullscreen=1" /><embed src="http://vimeo.com/moogaloop.swf?clip_id=' + url + '&amp;server=vimeo.com&amp;show_title=1&amp;show_byline=1&amp;show_portrait=0&amp;color=&amp;fullscreen=1" type="application/x-shockwave-flash" allowfullscreen="true" allowscriptaccess="always" width="400" height="300"></embed></object>'
    end
  end
  
end
