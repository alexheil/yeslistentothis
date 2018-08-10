class Video < ApplicationRecord
  extend FriendlyId
  friendly_id :slug, use: :slugged

  belongs_to :user

  has_many :votes

  before_save :should_generate_new_friendly_id?, if: :title_changed?
  before_save :generated_slug

  private

    def generated_slug
      require 'securerandom' 
      self.slug = SecureRandom.hex(3) if slug.blank?
    end

end
