class PresentationsController < ApplicationController


  def index
    @client = Client.find(params[:client_id])
    @presentations = @client.presentations
  end


  def show
    @client = Client.find(params[:client_id])
    @presentation = Presentation.find(params[:id])
  end

p
  def new
    @presentation = Presentation.new(:client_id => params[:client_id])        
  end


  def edit
    @presentation = Presentation.find(params[:id])    
  end


  def create
    
    @presentation = Presentation.new(params[:presentation])        
    @presentation.client_id = params[:client_id]

    if @presentation.save
      redirect_to client_presentation_url(:id => @presentation.id, :client_id => @presentation.client_id)
    end
    
  end

  
  def update

    @presentation = Presentation.find(params[:id])
    
    if @presentation.update_attributes(params[:presentation])    
      redirect_to client_presentation_url(:id => @presentation.id, :client_id => @presentation.client_id, :notice => 'Presentation was successfully updated.')
    end
    
  end



  def destroy
    
    @presentation = Presentation.find(params[:id])
    @presentation.destroy
    redirect_to client_presentations_url 
    
  end
end
