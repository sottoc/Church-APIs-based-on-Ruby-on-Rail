class Home < ApplicationRecord

	def self.which_sunday(week)
		@week = week - 1
		@today = Date.today
		@current_year = Date.today.year.to_i
		sunday_array(Date.today.month.to_i)
		if Date.new(@current_year, @current_month, @sundays[@week]) <= Time.now.in_time_zone('America/Los_Angeles').to_date
			new_month = Date.today.month.to_i + 1
			new_month == 13 ? new_month = 1 : new_month
			sunday_array(new_month)
		end
		Date.new(@current_year, @current_month, @sundays[@week])
	end
	def self.sunday_array(month)
		@current_month = month
		@days_in_month = Time.days_in_month(@current_month)
		@sundays = Array.new
		@first_sunday = (1..7).find {|d| Date.new(@current_year, @current_month, d).sunday?}
		(@first_sunday...@days_in_month).step(7) {|d| @sundays.push(d).to_ary}
	end
end
