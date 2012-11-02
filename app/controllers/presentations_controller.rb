class PresentationsController < ApplicationController

  before_filter :admin_only!, :except => [:show, :index]
  before_filter :active_only!, :only => [:show]

  def index
    @client = Client.find(params[:client_id])
    
    if(current_user.administrator?)
      @presentations = @client.presentations
    else
      @presentations = @client.presentations.where(:active => true)
    end
    
  end

  def show
    @client = Client.find(params[:client_id])
    @presentation = @presentation || Presentation.find(params[:id])
  end

p
  def new
    @presentation = Presentation.new(:client_id => params[:client_id])        
  end


  def edit
    @presentation = @presentation || Presentation.find(params[:id])    
  end


  def create
    
    @presentation = Presentation.new(params[:presentation])        
    @presentation.client_id = params[:client_id]

    if @presentation.save
      redirect_to client_presentation_url(:id => @presentation.id, :client_id => @presentation.client_id)
    end
    
  end

  
  def update

    @presentation = @presentation || Presentation.find(params[:id])
    
    if @presentation.update_attributes(params[:presentation])    
      redirect_to client_presentation_url(:id => @presentation.id, :client_id => @presentation.client_id, :notice => 'Presentation was successfully updated.')
    end
  
  end

  def destroy
    @presentation = Presentation.find(params[:id])
    @presentation.destroy
    redirect_to client_presentations_url 
  end
  
  private
  def active_only!
    @presentation = Presentation.find(params[:id])

    unless(@presentation.active? or current_user.administrator?)
      redirect_to :action => :index
    end
  end
end
