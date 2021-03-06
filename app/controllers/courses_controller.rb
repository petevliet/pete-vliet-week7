class CoursesController < ApplicationController

  before_action :authenticate, except: [:index, :show]

  def index
    @courses = Course.all
  end

  def show
    @course = Course.find(params[:id])
  end

  def new
    @course = Course.new
  end

  def create
    @course = Course.new(course_params)

    if @course.save
      redirect_to course_path(@course)
      flash[:notice] = 'New course added'
    else
      render :new
    end
  end

  def edit
    @course = Course.find(params[:id])
  end

  def update
    @course = Course.find(params[:id])

    if @course.update(course_params)
      redirect_to course_path(@course)
      flash[:notice] = 'Course updated'
    else
      render :edit
    end
  end

  def destroy
    @course = Course.find(params[:id])

    @course.destroy
    redirect_to courses_path
    flash[:notice] = 'Course deleted'
  end

  private
  def course_params
    params.require(:course).permit(:title, :day_night)
  end

end
