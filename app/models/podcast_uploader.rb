class PodcastUploader < Shrine
    # plugins and uploading logic
    plugin :determine_mime_type
    plugin :cached_attachment_data

    Attacher.promote { |data| PromoteJob.perform_later(data) }
    Attacher.delete { |data| DeleteJob.perform_later(data) }
    Attacher.validate do
      validate_max_size 100.megabyte, message: "File is too large max size is 100MB"
      validate_mime_type_inclusion ['application/mp3', 'application/x-mp3', 'application/octet-stream', 'audio/mpeg','audio/mp3']
  end
  end