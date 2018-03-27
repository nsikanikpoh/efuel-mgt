class Zone < ApplicationRecord
	belongs_to :company
	has_many	:stations
	has_many	:zonalmanagers
	has_many :sales_reports, :through => :stations
	#has_many :managers, :through => :stations




  extend FriendlyId
  
    friendly_id :aliass, use: [:slugged, :history, :finders]
  def aliass
    "company #{aliass1} #{name}"
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