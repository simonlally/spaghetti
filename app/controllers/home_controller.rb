class HomeController < ApplicationController
  allow_unauthenticated_access

  def index
    @messages = Message.order(created_at: :desc)
  end
end
