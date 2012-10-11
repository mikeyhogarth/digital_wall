class ConceptsController < ApplicationController
  def create
    @presentation = Presentation.find(params[:presentation_id])
    @concept = @presentation.concepts.create(params[:concept])
    redirect_to client_presentation_path(@presentation.client, @presentation)
    
  end
end
