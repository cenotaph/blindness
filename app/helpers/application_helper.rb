module ApplicationHelper
 
  
  def figure_sound_type(sound)
    if sound.url =~ /www\.goear\.com\//  # is goear
      
      id = sound.url.match(/\/listen\/(.+)\//)[1]

      return '<object width="353" height="132"><embed src="http://www.goear.com/files/external.swf?file=' + id + '"  type="application/x-shockwave-flash" wmode="transparent" quality="high" width="353" height="132"></embed></object>'
    end
  end
  
  def figure_video_type(video)

    if video.url =~ /youtube\.com/ # it's youtube

      return '<iframe width="640" height="600" src="' + video.url.gsub(/watch\?v\=/, 'embed/') + '" frameborder="0" allowfullscreen></iframe>'.html_safe

    elsif video.url =~ /vimeo\.com/ 
      return '<iframe src="' + video.url + '" width="640" height="480" frameborder="0" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe>'.html_safe
      
    end
  end
  
end
