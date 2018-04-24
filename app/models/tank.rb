class Tank < ApplicationRecord
  #belongs_to :station
  
  belongs_to :pump, foreign_key: :pump_id



    extend FriendlyId
  
    friendly_id :generate_caseNo, use: [:slugged, :history, :finders]
   



def generate_caseNo
        String.random(21, ['0'..'9','A'..'Z'] )

    end
    
    
    class String
    def self.random(len=32, character_set = ["A".."Z", "a".."z", "0".."9"])
    chars = character_set.map{|x| x.is_a?(Range) ? x.to_a : x }.flatten
    Array.new(len){ chars.sample }.join
  end
 

end


end
