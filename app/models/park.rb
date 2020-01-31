class Park < ApplicationRecord

validates :name, presence: true
validates :state, presence: true

scope :search, -> (search_param) { where("name like ?", "%#{search_param}%") }
scope :find_state, -> (search_param) { where("state like ?", "%#{search_param}%") }
scope :find_national, -> { where(national: true) }
scope :get_random, -> { Park.all.sample }

end
