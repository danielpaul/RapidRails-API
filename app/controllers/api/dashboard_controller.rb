class Api::DashboardController < ApplicationController
  before_action :authenticate_user!

  def index
    render json: {
      message: "Welcome to your dashboard",
      user: {
        id: current_user.id,
        clerk_id: current_user.clerk_id,
        name: current_user.name
      },
      org: current_org&.clerk_org_id
    }
  end
end 