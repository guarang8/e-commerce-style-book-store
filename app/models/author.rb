class Author < ActiveRecord::Base
  attr_accessible :first_name, :last_name
  has_and_belongs_to_many :books
  validates_presence_of :first_name, :last_name

  def name
  	"#{first_name} #{last_name}"
  end
end
