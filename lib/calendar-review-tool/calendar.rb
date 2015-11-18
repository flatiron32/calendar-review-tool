require 'ostruct'
require 'open-uri'
require 'json'

class Calendar
  SELECT_URL = "https://outlook.office365.com/api/v1.0/me/calendarview?" +
      "$select=Subject,Start" +
      "&$orderby=Start" +
      "&$top=100"


  def initialize()

  end

  def events(start_date, number_of_days = 1)
    url = SELECT_URL +
      "&startDateTime=#{start_date.to_time.utc.strftime '%FT%TZ'}" +
      "&endDateTime=#{(start_date.next_day number_of_days).to_time.utc.strftime '%FT%TZ'}"
    # puts url
    JSON.parse(open(url, http_basic_authentication: ["jacob.tomaw@orbitz.com", ""]).read)["value"].map do |raw_event|
      OpenStruct.new(:subject => raw_event["Subject"],
        :start_date_time => DateTime.parse(raw_event["Start"]) )
    end.uniq
  end
end
