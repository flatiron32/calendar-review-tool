require 'test_helper'
require 'calendar-review-tool/calendar'

class CalendarTest < Test::Unit::TestCase

  def setup
    # OpenURI.stubs(:open).yields("")
  end

  def teardown
  end

  def test_event_list
    url = "https://outlook.office365.com/api/v1.0/me/calendarview?" + 
      "$select=Subject,Start" + 
      "&startDateTime=2015-07-01T00:00:00Z" + 
      "&endDateTime=2015-07-02T00:00:00Z"
    cal = Calendar.new
    cal.stubs(:open).with(url).returns(File.open('test/events.json'))
    events = cal.events Date.new(2015, 7, 1)
    assert_equal 5, events.length
    events.each_index do |i|
      event = events[i]  
      assert_equal "Event #{i+1}", event.subject
      assert_equal Date.new(2015, 7, 1) + i, event.start_date_time.to_date
    end
    cal.unstub(:open)
  end
end
