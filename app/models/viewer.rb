class Viewer < ActiveRecord::Base
  scope :by_userAgent, -> (object) {where("user_agent like ?", "%#{object[:textsearch]}%")}
  scope :by_ipClient, -> (object) {where("ip_client like ?", "%#{object[:textsearch]}%")}
end
