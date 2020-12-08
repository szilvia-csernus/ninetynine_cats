class Rental < ApplicationRecord
    validates :start_date, :end_date, :status, :cat_id, presence: true

    belongs_to :cat
end