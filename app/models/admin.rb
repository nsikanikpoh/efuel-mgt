class Admin < ApplicationRecord
	
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


    #has_many :sales_reports


    def companyadmin?

    	self.is_a?(Companyadmin) 
    end


    def zonalmanager?

    	self.is_a?(Zonalmanager) 
    end 

    def manager?

    	self.is_a?(Manager) 
    end

  def full_name
    self.fname + " " + self.lname
  end



     extend FriendlyId
  
    friendly_id :aliass, use: [:slugged, :history, :finders]
  def aliass
    "#{aliass1} #{fname} #{lname} profile"
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
