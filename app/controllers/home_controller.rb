class HomeController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  def index

  end
  # def method_name
  #
  # end
end
