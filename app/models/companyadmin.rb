class Companyadmin < Admin
 	has_one :company
	has_many :stations, :through => :company
	has_many :zones, :through => :company
	has_many :zonalmanagers, :through => :company
	has_many :managers, :through => :company
end

