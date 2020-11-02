class User < ApplicationRecord
    after_create :welcome_send
    
    # admin_events () / foreign_key: 'admin_event_id' == la clef qui appartient au admins
    #                                                    qui apparaitra dans la table event 
    has_many :admin_events, foreign_key: 'admin_id', class_name: "Event"

    has_many :attendances
    has_many :events, through: :attendances


    def welcome_send
      UserMailer.welcome_email(self).deliver_now
    end
end
