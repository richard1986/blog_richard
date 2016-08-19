class Article < ActiveRecord::Base
  belongs_to :account
  has_many :comments

  scope :search_by_advertizer, -> (object){ where(advertizer: Account.where("fullname like ? AND role = 'advertizer'", "%#{object[:textsearch]}%").pluck(:id)) }
  scope :moderated, ->(id) {where(moderated: '1')}
  scope :active, ->{where(:status => "actived")}
  

  scope :by_fullname, -> (object) { includes(:account).where("accounts.fullname like ? ", "%#{object[:textsearch]}%").references(:account) }
  scope :by_title, -> (object) {where("title like ?", "%#{object[:textsearch]}%")}
  scope :by_description, -> (object) {where("description like ?", "%#{object[:textsearch]}%")}

  before_create :set_visits_count
  def update_visits_count
  	self.update(visits_count: self.visits_count + 1)
  end
  private
  	def set_visits_count
  		self.visits_count = 0
  	end
end
