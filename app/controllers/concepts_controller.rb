class ConceptsController < ApplicationController
  def create
    @presentation = Presentation.find(params[:presentation_id])
    @concept = Concept.create[params[:concept]]
  end
end
