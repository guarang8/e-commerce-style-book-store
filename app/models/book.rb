class Book < ActiveRecord::Base
  attr_accessible :blurb, :isbn, :page_count, :price, :published_at, :publisher_id, :title, :author_ids, :cover_image
  has_and_belongs_to_many :authors
  belongs_to :publisher
  has_many :cart_items
  has_many :carts, through: :cart_items
  validates_length_of :title, :in => 1..255
  validates_presence_of :publisher
  validates_presence_of :authors
  validates_presence_of :published_at
  validates_numericality_of :page_count, :only_integer => true
  validates_numericality_of :price
  validates_format_of :isbn, :with => /[0-9\-xX]{13}/
  validates_uniqueness_of :isbn
  mount_uploader :cover_image, ImageUploader # ImageUploader is 
                                             #the class name for cover image
  include Tire::Model::Search
  include Tire::Model::Callbacks

  def self.search(params)
      tire.search(load: true) do
        query { string params[:query], default_operator: "AND" } if params[:query].present?
        filter :range, published_at: { lte: Time.zone.now }
        sort { by :published_at, "desc" } if params[:query].blank?
      end
  end

  def to_indexed_json
      to_json( methods: [:publisher_name])
  end

  def publisher_name
    publisher.name
  end

  def self.latest
    find :all, :limit => 10, :order => "books.id DESC",
         :include => [:authors, :publisher]
  end
end
