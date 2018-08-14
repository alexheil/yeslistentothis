 class StaticPagesController < ApplicationController

  def home
    @winner = Video.all
    @videos = Video.all
  end

  def about
  end

  def faq
  end

  def updates
  end

  def privacy
  end

  def terms
  end

end