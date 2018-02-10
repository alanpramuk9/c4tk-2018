class AnnotationsController < ApplicationController
  before_action :ensure_logged_in
  before_action :ensure_valid_annotation_type

  helper_method :annotation

  def new; end

  def create
    annotation.assign_attributes(annotation_params)
    if annotation.save
      redirect_to annotation_path(annotation)
    else
      render new
    end
  end

  def show; end

  def edit
    render :new
  end

  def update
    annotation.assign_attributes(annotation_params)
    if annotation.save
      redirect_to annotation_path(annotation)
    else
      render :new
    end
  end

  def destroy
    annotation.destroy if annotation.user == current_user
    redirect_to profile_path
  end

private

  def annotation_params
    params
      .require(:annotation)
      .permit(
        :id, :type, :user_id, :title, :description,
        :quote, :url, :source, :author, :location,
        :private, :review_status, :censored
      )
  end

  def ensure_valid_annotation_type
    if params[:type].present? && params[:type] != annotation.type_identifier
      redirect_to new_annotation_path(annotation.type_identifier)
    end
  end

  def annotation
    @annotation ||= Annotation.find_by_id(params[:id])
    @annotation ||= current_user.build_annotation_of_type(annotation_type)
  end

  def annotation_type
    params[:type] || params[:annotation][:type]
  end
end