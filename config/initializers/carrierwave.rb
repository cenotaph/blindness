module CarrierWave
  module Uploader
    module Versions
      def full_filename(for_file)
        parent_name = super(for_file)
        ext         = File.extname(parent_name)
        base_name   = parent_name.chomp(ext)
        [version_name, base_name].compact.join('/') + ext
      end

      def full_original_filename
        parent_name = super
        ext         = File.extname(parent_name)
        base_name   = parent_name.chomp(ext)
        [version_name, base_name].compact.join('/') + ext
      end
    end
  end
end
# CarrierWave.configure do |config|
#   config.asset_host = "http://blindness.icewhistle.com/"
# end

CarrierWave.configure do |config|  
    config.storage = :aws
    config.aws_credentials = {
      :access_key_id      => ENV['amazon_access_key'],
      :secret_access_key  => ENV['amazon_secret'], 
      region: 'eu-west-1'
    }
    config.aws_acl    = :public_read

    config.aws_bucket  = "icewhistle-content"


  # config.fog_attributes = {'Cache-Control'=>'max-age=315576000'}  # optional, defaults to {}
end

