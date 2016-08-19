class Account < ActiveRecord::Base
	belongs_to :user
	has_many :articles
	has_many :comments
	validates :user_id, presence: true
	#mount_uploader :image, StampUploader
	has_attached_file :image, styles: { medium: "800x800>", thumb: "300x300>" }
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
	

	scope :by_id, -> (id) { find(id) }

	scope :search_by_fullname, -> (object) {where("fullname like ?", "%#{object[:textsearch]}%")}
  scope :search_by_phone, -> (object) {where("phone like ?", "%#{object[:textsearch]}%")}
  scope :search_by_acc_user, -> (object) { includes(:user).where("users.email like ?", "%#{object[:textsearch]}%").references(:user) }
end
