#these do work!

def overlapping_requests
        
    requests = CatRentalRequest.find_by_sql([
    "SELECT
    *
    FROM
    cat_rental_requests
    WHERE ( (start_date >= :sd AND start_date <= :ed)
            OR (end_date <= :ed AND end_date >= :sd)
            OR (start_date <= :sd AND end_date >= :ed))
            AND NOT id = :id",
    {:sd => self.start_date, :ed => self.end_date, :id => self.id} ])

end

    
def overlapping_requests
    
    requests = CatRentalRequest.find_by_sql([
    'SELECT
    *
    FROM
    cat_rental_requests
    WHERE  start_date >= ?',
    self.start_date])
end

def overlapping_requests  
    requests = CatRentalRequest
    .where( "(start_date >= :sd AND start_date <= :ed)
            OR (end_date <= :ed AND end_date >= :sd)
            OR (start_date <= :sd AND end_date >= :ed)", {sd: self.start_date, ed: self.end_date})
    .where.not(id: self.id)

end

