class RobotsController < ApplicationController

  before_action :set_robot, only: [ :show, :edit, :update ]

  def index
    @robots = Robot.all
  end

  def new
    @robot = Robot.new
  end

  def create
    @robot = Robot.new(robot_params)
    if @robot.save
      redirect_to @robot, notice: 'robo-input successful.'
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @robot.update(robot_params)
      redirect_to @robot, notice: 'robo-update successful.'
    else
      render :edit
    end
  end

  private

  def set_robot
    @robot = Robot.find(params[:id])
  end

  def robot_params
    params.require(:robot).permit(:name)
  end
end
