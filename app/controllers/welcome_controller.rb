class WelcomeController < ApplicationController
  def index
    @posts=Post.all.order("created_at DESC")
    @events=Event.all
  end
end
