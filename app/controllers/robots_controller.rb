class RobotsController < ApplicationController

  def index
    @robots = Robot.recent
  end

  def show
    @robot = Robot.find(params[:id])
  end

  def new
    @robot = Robot.new
  end

  def create
    @robot = Robot.new(robot_params)

    if @robot.save
      redirect_to @robot, notice: 'Robot was successfully created.'
    else
      render :new
    end
  end

  private
  def robot_params
    params.require(:robot).permit(:user_throw)
  end
end
