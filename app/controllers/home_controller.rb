class HomeController < ApplicationController
  before_action :authenticate_user!, only: [:admin]
  #  layout :none, only: :verse_of_the_day
  layout "admin", only: :admin
  layout "react", only: :vernon

  def admin
  end

  def index
    @featured = Event.all.where(["starttime > ?", Time.now.ago(2.days)]).order("starttime ASC").where(featured: true).limit(1)
    @listings = Location.all.where(show_in_listing: true)
  end

  def media
    @podcasts = Podcast.all.order("dateof DESC").limit(9)
  end

  def new
    @listings = Location.all.where(show_in_listing: true)
  end

  def expect
    @listings = Location.all.where(show_in_listing: true)
  end

  def nextstep
    @dates = Array.new
    (1..4).each { |d| @dates.push(Home.which_sunday(d)) }
  end

  def vernon
  end

  def letsencrypt
    # use your code here, not mine
    render text: "7fZlPb-fcMhTCqM0v6LKcL5vDJAC79gobZZRZxrSL0c.LUGLpVtUqTXmeOKVq5VWVEEWXPmun8mjkOOfB_gShBE"
  end

  def ajax_load_dashboard
    respond_to do |format|
      format.js
    end
  end

  def ajax_load_events
    respond_to do |format|
      format.js
    end
  end

  def ajax_load_locations
    respond_to do |format|
      format.js
    end
  end

  def ajax_load_podcasts
    respond_to do |format|
      format.js
    end
  end

  def ajax_load_connect_groups
    @connect_groups_not_approved = ConnectGroup.all.where(approved: [nil, false])
    respond_to do |format|
      format.js
    end
  end

  def ajax_load_users
    respond_to do |format|
      format.js
    end
  end
end
