class SubsController < ApplicationController
  before_action :require_logged_in

  def new
    render :new
  end

  def create
    @sub = Sub.new(sub_params)
    @sub.mod_id = current_user.id
    if @sub.save
      redirect_to sub_url(@sub)
    else
      flash[:errors] = @sub.errors.full_messages
      redirect_to new_sub_url
    end
  end

  def edit
    @sub = Sub.find(params[:id])
  end

  def update
    @sub = Sub.find(params[:id])
    if current_user.id != @sub.mod_id
      flash[:errors] = ["You are not the moderator of this sub-forum!"]
      redirect_to subs_url
    else
      if @sub.update_attributes(sub_params)
        redirect_to sub_url(@sub)
      else
        flash[:errors] = @sub.errors.full_messages
        redirect_to subs_url
      end
    end
  end

  def index
    @subs = Sub.all
  end

  def destroy
    @sub = Sub.find(params[:id])
    @sub.destroy
    flash[:errors] = @sub.errors.full_messages
    redirect_to subs_url
  end

  def show
    @sub = Sub.find(params[:id])
  end

  def sub_params
    params.require(:sub).permit(:title, :description)
  end
end
