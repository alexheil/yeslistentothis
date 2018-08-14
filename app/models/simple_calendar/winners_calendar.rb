class SimpleCalendar::WinnersCalendar < SimpleCalendar::Calendar
  private

    def date_range
      beginning = Date.today - 1.day
      ending    = Date.today - 1.day
      (beginning..ending).to_a
    end

end