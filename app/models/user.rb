class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
    after_create :welcome_send
    
    has_one_attached :avatar
    # admin_events () / foreign_key: 'admin_event_id' == la clef qui appartient au admins
    #                                                    qui apparaitra dans la table event 
    has_many :admin_events, foreign_key: 'admin_id', class_name: "Event"

    has_many :attendances
    has_many :events, through: :attendances


    def welcome_send
      UserMailer.welcome_email(self).deliver_now
    end
end
