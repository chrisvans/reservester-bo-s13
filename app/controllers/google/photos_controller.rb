class Google::PhotosController < ApplicationController
  before_filter :require_current_google_image, :only => :show

  def show
    options = { :disposition => :inline }

    if current_google_image.content_type.present?
      options.merge!(:type => current_google_image.content_type) 
    end

    send_data current_google_image.body, options
  end

  private

  def require_current_google_image
    render_not_found unless current_google_image
  end

  def current_google_image
    @current_google_image ||= Google::Photo.find(params[:id])
  end

end
