class Manager < Admin
 	belongs_to :station, foreign_key: :station_id
 	belongs_to :company
 	#belongs_to :zone
end
