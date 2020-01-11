class Member < ApplicationRecord
    validates :name, presence: true
    validates :dob, presence: true
    validates :address, presence: true
end
