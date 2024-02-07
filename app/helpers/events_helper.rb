module EventsHelper
  def price(event)
    event.free? ? 
      "Free" : 
      number_to_currency(event.price, precision: 0)
  end

  def day_and_time(event)
    event.starts_at.strftime("%B %d at %I:%M %P")
  end
end
