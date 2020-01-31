class Park < ApplicationRecord

validates :name, presence: true
validates :state, presence: true

scope :search, -> (search_param) { where("name like ?", "%#{search_param}%") }
scope :find_national, -> { where(national: true) }

end
