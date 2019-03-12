module Admin::UsersHelper
   def amazon_image_url(user)
      objects = s3_objects || []
      image = objects.detect{|obj| obj.key == user.avatar&.attachment&.blob&.key}
      if image.present?
        image.presigned_url(:get, {}).to_s
      else
        "https://via.placeholder.com/100x100"
      end
   end

   def s3_objects
    s3 = Aws::S3::Resource.new(access_key_id: ENV['AWS_ACCESS_KEY_ID'], secret_access_key: ENV['AWS_SECRET_ACCESS_KEY_ID'], region: 'us-east-1')
    s3.bucket(ENV['AWS_BUCKET']).objects
   end
end
