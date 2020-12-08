class Cat < ApplicationRecord
    validates :name, :birth_date, :color, :sex, presence: true

    has_many :rentals
end