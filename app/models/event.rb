class Event < ApplicationRecord
    belongs_to :admin, class_name: "User"

    has_many :attendances
    has_many :attendants, class_name: "User", through: :attendances

    # validates :start_date_cannot_be_in_past
    # validates :duration_is_multiple_of_5
    # validate :start_date, presence: true
    # validates :title, presence: true, length: { in: 5..140 }
    # validates :description, presence: true, length: {in: 20..1000}
    # validates :price, presence: true, numericality: {greater_than: 0, less_or_equal_to: 1000}
    # validates :location, presence: true


    # def start_date_cannot_be_in_past
    #     errors.add(:start_date, "can't be in the past") if
    #     !start_date.blank? && start_date < Time.now
    # end

    # def duration_is_multiple_of_5
    #     errors.add(:duration, "is multiple of 5") if
    #     duration.to_f % 5 != 0
    # end
end
