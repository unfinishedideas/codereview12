class Park < ApplicationRecord

validates :name, presence: true
validates :state, presence: true

scope :search, -> (search_param) { where("name like ?", "%#{search_param}%") }

end
