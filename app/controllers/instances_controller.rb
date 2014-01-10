class InstancesController < ApplicationController

  def index
    @instances = AWS.ec2.instances
    binding.pry
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
