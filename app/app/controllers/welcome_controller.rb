class WelcomeController < ApplicationController
  def index
    redirect_to translate_posts_path('en')
  end
end
