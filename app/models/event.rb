class Event < ActiveRecord::Base
  belongs_to :registered_application

    def add_event(event)
        current_event = event.find_by(event_id: event.id)
        if current_event
            current_event.count +=1
        else
            current_event = event.build(event_id: product.id)
        end
        current_event
    end
        

end
