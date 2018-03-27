class SalesReport < ApplicationRecord
	
	enum remark: [:correct, :MoneyShortage, :SurplusMoney, :InvalidSalesReport]
  belongs_to :product, :foreign_key => :product_id
  belongs_to :pump, :foreign_key => :pump_id
  belongs_to :admin, :foreign_key => :admin_id 
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
