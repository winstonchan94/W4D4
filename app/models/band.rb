# == Schema Information
#
# Table name: bands
#
#  id   :integer          not null, primary key
#  name :string           not null
#

class Band < ApplicationRecord
  validates :name, presence: true

  has_many :albums,
    class_name: :Album,
    foreign_key: :band_id,
    dependent: :destroy

  has_many :tracks,
    through: :albums,
    source: :tracks,
    dependent: :destroy
end
