class User < ApplicationRecord
    has_many :attendances
    has_many :attending_events, foreign_key: 'attendant_id', class_name: "Event"
end
