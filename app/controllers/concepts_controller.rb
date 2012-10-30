class ConceptsController < ApplicationController
  
  before_filter :admin_only!, :except => :show

  
  def show
    @concept = Concept.find(params[:id])
    @presentation = @concept.presentation
    @client = @presentation.client
  end
  
  def edit
    @concept = Concept.find(params[:id])
    @presentation = @concept.presentation
  end
  
  def update
    
    @concept = Concept.find(params[:id])
    @presentation = @concept.presentation
        
    if @concept.update_attributes(params[:concept])    
      redirect_to presentation_concept_url(:id => @concept.id, :presentation_id => @concept.presentation_id, :notice => 'Concept was successfully updated.')
    end

  end
  
  def new
    @presentation = Presentation.find(params[:presentation_id])
    @concept = @presentation.concepts.build
    @is_remote = true
    
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
