class Manage::NotificationsController < ManageController
  def index

  end

  def create
    if create_params[:stage_id].present?
      stage = Stage.find(create_params[:stage_id])
      NotificationJob.perform_later(create_params[:message], stage.id)
    else
      NotificationJob.perform_later(create_params[:message])
    end
    redirect_to manage_notifications_path
  end

  private

  def create_params
    params.require(:notification).permit(:stage_id, :message)
  end
end
