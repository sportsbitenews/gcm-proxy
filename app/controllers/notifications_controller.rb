class NotificationsController < ApplicationController
  
  before_filter { @application = Application.find(params[:application_id].to_i) }
  before_filter { params[:id] && @notification = @application.notifications.find(params[:id].to_i) }
  
  def index
    @notifications = @application.notifications.asc.page(params[:page])
  end
  
end
