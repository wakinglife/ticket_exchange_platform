class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :ticket, counter_cache: true
end
