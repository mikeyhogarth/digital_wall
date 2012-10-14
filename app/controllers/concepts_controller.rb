class ConceptsController < ApplicationController
  
  before_filter :admin_only!

  def new
    @presentation = Presentation.find(params[:presentation_id])
    @concept = @presentation.concepts.build

    render partial: "form"
  end
  
  
  def create
    @presentation = Presentation.find(params[:presentation_id])
    @concept = @presentation.concepts.new(params[:concept])

    if(@concept.save)
      redirect_to client_presentation_path(@presentation.client, @presentation)
    else
      render partial: "form"
    end
    
  end
  
  
  def destroy
    @presentation = Presentation.find(params[:presentation_id])
    @concept = Concept.find(params[:id])
    @concept.destroy
    
    redirect_to client_presentation_path(@presentation.client, @presentation) 
    
  end
  
end
