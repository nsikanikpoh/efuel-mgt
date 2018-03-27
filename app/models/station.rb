class Station < ApplicationRecord
  belongs_to :zone, foreign_key: :zone_id
  belongs_to :company
  #has_many :tanks
  has_many :managers, dependent: :destroy
  #has_many :zonalmanagers
  has_many :products, dependent: :destroy
  has_many :sales_reports, :through => :products
  has_many :stocks, :through => :products
  has_many :pumps, :through => :products
  has_many :tanks, :through => :products




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
