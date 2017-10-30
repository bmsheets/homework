class Track < ApplicationRecord
  validates :album_id, :title, :ord, presence: true

  belongs_to :album,
    primary_key: :id,
    foreign_key: :album_id,
    class_name: :Album
end
