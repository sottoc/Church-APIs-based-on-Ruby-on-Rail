class AudioClipsController < ApplicationController
  
skip_before_action :verify_authenticity_token

  def create
    begin
      @f = File.new("#{Rails.root}/public/audio_clips/#{Time.now.to_formatted_s(:podcast)} | #{params[:recordName]}", "wb")
      @f.write(request.raw_post)
      @f.close
      render :text => "save=ok&fileurl=/audio_clips/#{params[:recordName]}"
    rescue
      render :text => "save=fail"
    end
  end
end