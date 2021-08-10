# frozen_string_literal: true

class OreproPrediction< ApplicationRecord
  validates :race_id, presence: true
  validates :email, presence: true
  validates :honmei, presence: true
end
