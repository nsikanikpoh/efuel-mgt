class Company < ApplicationRecord
	
	has_many :stations, dependent: :destroy
	has_many :managers
	has_many :zonalmanagers, dependent: :destroy
	belongs_to :companyadmin, foreign_key: :companyadmin_id
	has_many :zones, dependent: :destroy
	has_many :stocks, :through => :stations
	has_many :pumps, :through => :stations
	has_many :sales_reports, :through => :stations








	 extend FriendlyId
  
    friendly_id :aliass, use: [:slugged, :history, :finders]
  def aliass
    "#{aliass1} #{name} Company"
  end

 
def aliass1
        String.random(20, ['0'..'9','A'..'Z'] )

    end
    
    
    class String
    def self.random(len=32, character_set = ["A".."Z", "a".."z", "0".."9"])
    chars = character_set.map{|x| x.is_a?(Range) ? x.to_a : x }.flatten
    Array.new(len){ chars.sample }.join
  end
 

end




end
