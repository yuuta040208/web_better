# frozen_string_literal: true

class Netkeiba::Orepro::Request
  include ActiveModel::Model
  include ActiveModel::Attributes

  attribute :email, :string
  attribute :password, :string
  attribute :race_id, :string
  attribute :honmei, :integer
  attribute :taikou, :integer
  attribute :tanana, :integer
  attribute :renkas, array: :integer
  attribute :double, :boolean

  validates :email, presence: true
  validates :password, presence: true
  validates :race_id, presence: true
  validates :honmei, presence: true

  def save!
    # OreproPrediction.create!(attributes)
  end

  def error_message
    errors.full_messages.to_s
  end
end