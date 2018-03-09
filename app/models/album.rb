# == Schema Information
#
# Table name: albums
#
#  id      :integer          not null, primary key
#  band_id :integer          not null
#  title   :string           not null
#  year    :integer          not null
#  live    :boolean          default(FALSE), not null
#

class Album < ApplicationRecord
  validates :title, :year, :band_id, presence: true

  belongs_to :band,
    class_name: :Band,
    foreign_key: :band_id

  has_many :tracks,
    class_name: :Track,
    foreign_key: :album_id,
    dependent: :destroy

end
