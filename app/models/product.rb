class Product < ApplicationRecord
  belongs_to :station
  has_many :stocks, dependent: :destroy
 
  has_many :pumps, dependent: :destroy
  has_many :tanks, :through => :pumps
  has_many :sales_reports



  extend FriendlyId
  
    friendly_id :aliass, use: [:slugged, :history, :finders]
  def aliass
    "company #{aliass1} #{name}"
  end

 
def aliass1
        String.random(15, ['0'..'9','A'..'Z'] )

    end
    
    
    class String
    def self.random(len=32, character_set = ["A".."Z", "a".."z", "0".."9"])
    chars = character_set.map{|x| x.is_a?(Range) ? x.to_a : x }.flatten
    Array.new(len){ chars.sample }.join
  end
 

end




end
