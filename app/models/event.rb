class Event < ApplicationRecord
	belongs_to :user
	validates :title,:body, presence: true


	has_attached_file :image, styles: { medium: "342x187>", small: "80x55>"}, default_url: "/images/:style/missing.png"
    validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
end
