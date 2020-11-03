class Event < ApplicationRecord
    belongs_to :admin, class_name: "User"

    has_many :attendances
    has_many :users, through: :attendances

    # validates :start_date_cant_be_in_the_past
    # validates :dutation_multiple_of_5
    # validate :start_date, presence: true
    # validates :title, presence: true, length: { in: 5..140 }
    # validates :description, presence: true, length: {in: 20..1000}
    # validates :price, presence: true, numericality: {greater_than: 0, less_or_equal_to: 1000}
    # validates :location, presence: true


    def start_date_cant_be_in_the_past
        errors.add(:start_date, "Ne peut-être dans le passé") if
        !start_date.blank? && start_date < Time.now
    end

    def dutation_multiple_of_5
        errors.add(:duration, "Dois-être un multiple de 5") if
        duration.to_f % 5 != 0
    end
end
