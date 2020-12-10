require 'action_view'

class Cat < ApplicationRecord
    include ActionView::Helpers::DateHelper

    COLORS = ["white", "black", "orange", "brown"]
    SEXES = ["M", "F"]

    validates :name, :birth_date, :color, :sex, presence: true
    validates :color, inclusion: COLORS
    validates :sex, inclusion: SEXES
    validate :valid_birth?

    has_many :rentals

    def valid_birth?
        errors[:birth_date] << "not a valid date" unless self.birth_date.is_a?(Date)
        errors[:birth_date] << "can't be in future" unless Date.today > self.birth_date 
    end

    def age
        time_ago_in_words(self.birth_date) 
    end
end