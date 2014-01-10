class InstancesController < ApplicationController
  include InstancesHelper

  def index
    @instances = retrieve_instances
    respond_to do |format|
      format.html
      format.json { render json: @instances }
    end
  end

  private
  def instance_params
    params.require(:instance).permit(
      :id,
      :tag_set,
      :instances_set
    )
  end
end
