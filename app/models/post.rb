class Post < ActiveRecord::Base
  mount_uploader :localimage, ImageUploader
  mount_uploader :localfile, AttachmentUploader
  belongs_to :user
  
  default_scope { order("created_at DESC")}
  
  extend FriendlyId
  friendly_id :name_and_type, use: :slugged
  
  def name_and_type
    [mytype, title].join('/')
  end
  
  def mytype
    case self.the_type
      when 1
        return "post"
      when 2
        return "image"
      when 3
        return "quote"
      when 4
        return "link"
      when 5
        return "unknown"
      when 6
        return "video"
      when 7
        return "sound"
      else
         return "unknown"
    end
  end
  
  def title
    if self[:title].blank?
      ""
    else
      self[:title].gsub(/\\\'/, "'").gsub(/\\\"/, '"')
    end
  end
  
  def description
    if self[:description].blank?
      ""
    else
      self[:description].gsub(/\\\'/, "'").gsub(/\\\"/, '"')
    end
  end
    
end