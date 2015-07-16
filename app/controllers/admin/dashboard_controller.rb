class Admin::DashboardController < ApplicationController

  before_filter :authenticate_user!, only: [:edit, :update, :destroy]
  load_and_authorize_resource

  def index
  end

end

