class AnnotationsController < ApplicationController
  
  def index
    @concept = Concept.find(params[:concept_id])
    @presentation = @concept.presentation
    @client = @presentation.client
    @annotations = @concept.annotations
  end

  def show
  end
  
  def new
    @concept = Concept.find(params[:concept_id])
    @annotation = @concept.annotations.build
    render :layout => false
  end

  def create
    @concept = Concept.find(params[:concept_id]);
    @annotation = @concept.annotations.new(params[:annotation])
    @annotation.user = current_user
    
    if(@annotation.save)
      redirect_to concept_annotations_path(@concept)
    end
  end

  def destroy
  end
end
