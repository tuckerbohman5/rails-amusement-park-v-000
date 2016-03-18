class Ride < ActiveRecord::Base
  belongs_to :attraction
  belongs_to :user

  def take_ride
    @error_message = ["Sorry."]
    check_tickets
    check_height
    if @error_message.count <= 1
      user.tickets -= attraction.tickets
      user.nausea += attraction.nausea_rating
      user.happiness += attraction.happiness_rating
      user.save
      "Thanks for riding the #{self.attraction.name}!"
    else
      @error_message.join(" ")
    end
  end

  def check_tickets
    if user.tickets < attraction.tickets 
      @error_message << "You do not have enough tickets the #{self.attraction.name}."
    end
  end

  def check_height
    if user.height < attraction.min_height
      @error_message << "You are not tall enough to ride the #{self.attraction.name}."
    end
  end

end
