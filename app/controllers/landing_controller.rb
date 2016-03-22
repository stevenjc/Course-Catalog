class LandingController < ApplicationController
  def show
    if not signed_in?
        redirect_to "/sign_in"
    end
  end
end
