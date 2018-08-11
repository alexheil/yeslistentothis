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
  before_save :pick_date

  private

    def generated_slug
      require 'securerandom' 
      self.slug = SecureRandom.hex(3) if slug.blank?
    end

    def title_generated
      self.title = self.artist + " - " + self.track
    end

    def pick_date
      if self.start_time.blank?
        if month == "January"
          self.month = "1"
        elsif month == "February"
          self.month = "2"
        elsif month == "March"
          self.month = "3"
        elsif month == "April"
          self.month = "4"
        elsif month == "May"
          self.month = "5"
        elsif month == "June"
          self.month = "6"
        elsif month == "July"
          self.month = "7"
        elsif month == "August"
          self.month = "8"
        elsif month == "September"
          self.month = "9"
        elsif month == "October"
          self.month = "10"
        elsif month == "November"
          self.month = "11"
        elsif month == "December"
          self.month = "12"
        end

        self.start_time = self.year + "-" + self.month + "-" + self.day
      end
    end

end
