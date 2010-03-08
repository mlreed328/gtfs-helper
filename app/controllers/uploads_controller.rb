class UploadsController < ApplicationController
  def new
    @upload = Upload.new
  end
  def create
    @upload = Upload.new(params[:upload])
    flash[:notice] = "Upload created"
    redirect_to root_path
  end
end
