class Zonalmanager < Admin
 	
 	
 	belongs_to :company, foreign_key: :company_id
 	belongs_to :zone, foreign_key: :zone_id
 	has_many :stations, :through => :zone
end
