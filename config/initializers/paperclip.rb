Paperclip::Attachment.default_options[:url] = ':s3_alias_url'
Paperclip::Attachment.default_options[:path] = '/:class/:attachment/:id_partition/:style/:filename'
Paperclip::Attachment.default_options[:s3_host_alias] = ENV['S3_BUCKET_NAME']+'.s3.amazonaws.com'
Paperclip.options[:command_path] = '/usr/bin'