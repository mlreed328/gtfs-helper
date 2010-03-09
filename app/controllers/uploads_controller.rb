class UploadsController < ApplicationController
  def new
    @upload = Upload.new
  end
  def create
    @upload = Upload.new(params[:upload])
    if @upload.save
      flash[:notice] = "Upload created"
      redirect_to root_path
    else
      flash[:notice] = "Error"
      render :new
    end
  end
end
