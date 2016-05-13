class WelcomeController < ApplicationController

  skip_before_action :authenticate_user!

  def main_page
  end

end