# == Schema Information
#
# Table name: tracks
#
#  id       :integer          not null, primary key
#  ord      :integer          not null
#  album_id :integer          not null
#  lyrics   :text
#  bonus    :boolean          default(FALSE), not null
#  title    :string           not null
#

class Track < ApplicationRecord
  validates :album_id, :title, :ord, presence: true
  validates :bonus, inclusion: { in: [true, false] }
  validates :ord, uniqueness: {
    scope: :album_id, message: "Already track of this # on album"
  }

  belongs_to :album,
    class_name: :Album,
    foreign_key: :album_id

  has_one :band,
    through: :album,
    source: :band

end
