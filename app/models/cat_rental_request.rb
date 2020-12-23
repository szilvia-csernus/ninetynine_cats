class CatRentalRequest < ApplicationRecord
    STATUS = ["PENDING", "APPROVED", "DENIED"]

    validates :start_date, :end_date, :status, :cat_id, :user_id, presence: true
    validates :status, inclusion: STATUS
    validate :does_not_overlap_approved_request

    belongs_to :cat
    belongs_to :requester, class_name: :User, foreign_key: :user_id

    def overlapping_requests  
       requests = CatRentalRequest
       .where( "(start_date >= :sd AND start_date <= :ed)
               OR (end_date <= :ed AND end_date >= :sd)
               OR (start_date <= :sd AND end_date >= :ed)", {sd: self.start_date, ed: self.end_date})
       .where.not(id: self.id)
       .where(cat_id: self.cat_id)

    end

    def overlapping_approved_requests
        overlapping_requests
        .where( status: "APPROVED")
    end

    def overlapping_pending_requests
        overlapping_requests
        .where( status: "PENDING")
    end

    def does_not_overlap_approved_request
        if overlapping_approved_requests.exists?
            errors[:overlap] << "with approved request(s)."
        end
    end

    def approve!
        self.transaction do
            self.status = "APPROVED"
            self.save!
            overlapping_pending_requests
            .update_all(status: "DENIED")
        end
    end

    def deny!
        self.transaction do
            self.status = "DENIED"
            self.save!
        end  
    end

    def pending?
        self.status == "PENDING"
    end
end