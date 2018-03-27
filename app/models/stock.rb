class Stock < ApplicationRecord
  belongs_to :station
  belongs_to :product
  has_one	:stock_tank
  has_many :pumps, :through => :product
  has_many :sales_reports
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
