module ApplicationHelper
  def breadcrumb_content
     content_for(:breadcrumb) || "Dashboard"
   end

   def amazon_image_url(user)
   		objects = s3_objects || []
   		objects.detect{|obj| obj.key == user.avatar&.attachment&.blob&.key}.presigned_url(:get, {}).to_s
   end

   def s3_objects
   	s3 = Aws::S3::Resource.new(access_key_id: ENV['AWS_ACCESS_KEY_ID'], secret_access_key: ENV['AWS_SECRET_ACCESS_KEY_ID'], region: 'us-east-1')
		s3.bucket(ENV['AWS_BUCKET']).objects
   end
end
