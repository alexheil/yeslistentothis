class SimpleCalendar::PastWinnersCalendar < SimpleCalendar::Calendar
  private

    def date_range
      beginning = Date.today - 30.days
      ending    = Date.today
      (beginning..ending).to_a
    end

end