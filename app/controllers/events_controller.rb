class EventsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show, :revelstoke, :kelowna]
  before_action :set_event, only: [:show, :edit, :update, :destroy]
  before_action :set_current_events, only: [:index, :revelstoke, :kelowna]
  load_and_authorize_resource except: [:index, :revelstoke, :kelowna]

  include ActionController::MimeResponds
  require 'icalendar/tzinfo'

  def admin
    @events = Event.all
  end

  def index
    @events = Event.all
  end

  def revelstoke
    calendar = Icalendar::Calendar.new
    tzid = "America/Vancouver"
    tz = TZInfo::Timezone.get tzid
    calendar.add_timezone tz.ical_timezone DateTime.now
    @current_events.each do |item|
      unless item.location.name.downcase == 'kelowna'
        event = Icalendar::Event.new
        calendar.event do |e|
          e.dtstart = Icalendar::Values::DateTime.new item.starttime, 'tzid' => tzid
          e.dtend   = Icalendar::Values::DateTime.new item.endtime, 'tzid' => tzid if item.endtime
          e.summary = item.title
          e.description = item.description
        end
      end
    end
    respond_to do |format|
      format.ics { render text: calendar.to_ical }
    end
  end

  def kelowna
    calendar = Icalendar::Calendar.new
    tzid = "America/Vancouver"
    tz = TZInfo::Timezone.get tzid
    calendar.add_timezone tz.ical_timezone DateTime.now
    @current_events.each do |item|
      unless item.location.name.downcase == 'revelstoke'
        event = Icalendar::Event.new
        calendar.event do |e|
          e.dtstart = Icalendar::Values::DateTime.new item.starttime, 'tzid' => tzid
          e.dtend   = Icalendar::Values::DateTime.new item.endtime, 'tzid' => tzid if item.endtime
          e.summary = item.title
          e.description = item.description
        end
      end
    end
    respond_to do |format|
      format.ics { render text: calendar.to_ical }
    end
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    @event.save ? redirect_to(@event, notice: 'Event was successfully created') : render(action: 'new')
  end

  def update
    @event.update(event_params) ? redirect_to(@event, notice: 'Event was successfully updated') : render(action: 'edit')
  end

  def destroy
    @event.destroy
    redirect_to events_url
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_event
    @event = Event.find(params[:id])
  end

  def set_current_events
    @current_events = Array.new
    Event.all.each do |event|
      event.limit ||= 0
      if !event.starttime
        event.starttime = DateTime.tomorrow
      end
      if event.starttime.future?
        @current_events.push(event)
      elsif event.repeat      #repeating events
        if event.frequency.downcase == 'daily'
          start = event.starttime
          finish = event.starttime + event.limit.days
          while(start <= finish)
            event.starttime = start
            if event.starttime.future?
              @current_events.push(event)
              start = finish + 1.day
            else start += 1.day
            end
          end
        elsif event.frequency.downcase == 'weekly'
          if event.starttime.wday < event.repeat_day
            diff = event.repeat_day - event.starttime.wday
            event.starttime = event.starttime + diff.days
          else diff = event.starttime.wday - event.repeat_day
            event.starttime = event.starttime - diff.days
          end
          start = event.starttime
          finish = event.starttime + event.limit.weeks
          while(start <= finish)
            event.starttime = start
            if event.starttime.future?
              @current_events.push(event)
              start = finish + 1.week
            else start += 1.week
            end
          end
        elsif event.frequency.downcase == 'monthly'
          beginning_hour = event.starttime.strftime("%H").to_i
          beginning_minute = event.starttime.strftime("%M").to_i
          start = event.starttime
          finish = event.starttime + event.limit.months
          while(start <= finish)
            if event.repeat_date
              event.starttime = start
            else
              current_month = start.month
              current_year = start.year
              working_date = (1..7).find {|d| Date.new(current_year, current_month, d).wday == event.repeat_day}
              event.repeat_week.nil? ? working_date : working_date = working_date + (7*(event.repeat_week-1))
              start = DateTime.new(current_year,current_month,working_date,beginning_hour,beginning_minute)
              event.starttime = start
            end
            if event.starttime.future?
              @current_events.push(event)
              start = finish + 1.month
            else start += 1.month
            end
          end
        end
      end
    end
    @current_events = @current_events.sort_by{|item| [ item['starttime']]}

  end
  # Never trust parameters from the scary internet, only allow the white list through.
  def event_params
    params.require(:event).permit(:title, :description, :starttime, :endtime, :image,
    :location_id, :featured, :event_type_id, :hash_tag,
    :facebook, :repeat, :frequency, :repeat_date, :repeat_day, :repeat_week, :limit)
  end
end
