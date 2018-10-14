class ExperiencesController < ApplicationController

  before_action :set_experience, except: [:index, :new, :create]
  before_action :authenticate_user!, except: [:show]
  before_action :is_authorised, only: [:listing, :pricing, :description,   :location, :update]


  def index
    @experiences = current_user.experiences
  end

  def new

    @experience = current_user.experiences.build

  end

  def create

    @experience = current_user.experiences.build(experience_params)
    if @experience.save
      redirect_to listing_experience_path(@experience), notice: "Saved..."
    else
      flash[:alert] = "Something went wrong..."
      render :new
    end
  end

  def show

  end


  def listing
  end

  def pricing
  end

  def description
  end

  def location
  end

  def update
    new_params = experience_params
    #new_params = experience_params.merge(active: true) if is_ready_experience

    if @experience.update(new_params)
      flash[:notice] = "Saved..."
    else
      flash[:alert] = "Something went wrong..."
    end
    redirect_back(fallback_location: request.referer)
  end


  private

  def set_experience
    @experience = Experience.find(params[:id])
  end

  def experience_params
    params.require(:experience).permit(:exp_type, :listing_name, :summary, :address, :price, :active, :latitude, :longitude)
  end


  def is_authorised
    redirect_to root_path, alert: "You don't have permission" unless current_user.id == @experience.user_id
  end
end
