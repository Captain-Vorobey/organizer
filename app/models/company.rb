class Company < ApplicationRecord
    has_many :service
    has_one :address, :as => :addressable
    resourcify
end
