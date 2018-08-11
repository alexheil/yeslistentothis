class Video < ApplicationRecord
  extend FriendlyId
  friendly_id :slug, use: :slugged

  include ImageUploader[:image]
  include VideoUploader[:video]


  belongs_to :user

  has_many :votes, dependent: :destroy
  has_many :users, through: :votes

  before_save :should_generate_new_friendly_id?, if: :title_changed?
  before_save :generated_slug
  before_save :title_generated

  private

    def generated_slug
      require 'securerandom' 
      self.slug = SecureRandom.hex(6) if slug.blank?
    end

    def title_generated
      self.title = self.artist + ", " + self.track
    end

end
