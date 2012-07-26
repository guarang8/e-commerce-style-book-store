class Publisher < ActiveRecord::Base
   attr_accessible :name
   validates_length_of :name, :in => 2..255
   validates_uniqueness_of :name
end
