class Attendance < ApplicationRecord
    belongs_to :event
    belongs_to :user
    after_create :join_event

    def join_event
      AttendanceMailer.user_join_event(self).deliver_now
    end
  
end
