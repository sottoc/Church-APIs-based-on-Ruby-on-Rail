require "shrine"
require "shrine/storage/file_system"
require "shrine/storage/s3"

s3_options = {
   access_key_id:      ENV['AWS_ACCESS_KEY_ID'],
   secret_access_key:  ENV['AWS_SECRET_ACCESS_KEY'],
   region:             ENV['AWS_REGION'],
   bucket:             ENV['S3_BUCKET_NAME'],
}

Shrine.storages = {
   cache: Shrine::Storage::S3.new(prefix: "shrine/cache", **s3_options),
   store: Shrine::Storage::S3.new(prefix: "shrine/store", **s3_options),
}

Shrine.plugin :activerecord
Shrine.plugin :cached_attachment_data # for forms
Shrine.plugin :validation_helpers
Shrine.plugin :backgrounding
Shrine.plugin :presign_endpoint