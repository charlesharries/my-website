class Post < ApplicationRecord
  belongs_to :user
  validates :title, :subtitle, :category, presence: true
  validate :picture_size

  mount_uploaders :pictures, PictureUploader
  serialize :pictures, JSON

  scope :work,        -> { where category: 'work' }
  scope :opinion,     -> { where category: 'opinion' }
  scope :experiments, -> { where category: 'experiment' }
  scope :published,   -> { where published: true }
  scope :drafts,      -> { where published: false }

  def published=(arg)
    self.update_attribute(:published, arg)
  end

  private

    def picture_size
      pictures.each do |picture|
        if picture.size > 5.megabytes
          errors.add(:pictures, "Each picture must be smaller than 5MB")
        end
      end
    end
end
