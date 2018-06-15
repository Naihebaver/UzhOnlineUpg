class Post < ApplicationRecord
	belongs_to :user
	belongs_to :category
	has_many :postcomments
	validates :title,:body, presence: true
 	validates :title, length: { in: 3..200 }
 	is_impressionable :counter_cache => true, :column_name => :impressions_count, :unique => :request_hash


 	has_attached_file :image, styles: { medium: "342x187>", small: "80x55>"}, default_url: "/images/:style/missing.png"
    validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
end
