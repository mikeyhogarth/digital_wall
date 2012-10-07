class PresentationsController < ApplicationController
  # GET /presentations
  # GET /presentations.json
  def index
    
    @client = Client.find(params[:client_id])
    @presentations = @client.presentations
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @presentations }
    end
    
  end

  # GET /presentations/1
  # GET /presentations/1.json
  def show
    
    @presentation = Presentation.find(params[:id])
    
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @presentation }
    end
  end

  # GET /presentations/new
  # GET /presentations/new.json
  def new
    @presentation = Presentation.new(:client_id => params[:client_id])        
    
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @presentation }
    end
  end

  # GET /presentations/1/edit
  def edit
    @presentation = Presentation.find(params[:id])    
  end

  # POST /presentations
  # POST /presentations.json
  def create
    
    @presentation = Presentation.new(params[:presentation])    
    
    @presentation.client_id = params[:client_id]

    if @presentation.save
      redirect_to client_presentation_url(:id => @presentation.id, :client_id => @presentation.client_id)
    end
    
  end

  
  # PUT /presentations/1
  # PUT /presentations/1.json
  def update

    @presentation = Presentation.find(params[:id])
    
    if @presentation.update_attributes(params[:presentation])
      
      redirect_to client_presentation_url(:id => @presentation.id, :client_id => @presentation.client_id, :notice => 'Presentation was successfully updated.')
            
    end
    
  end

  # DELETE /presentations/1
  # DELETE /presentations/1.json
  def destroy
    @presentation = Presentation.find(params[:id])
    @presentation.destroy

    respond_to do |format|
      format.html { redirect_to client_presentations_url }
      format.json { head :no_content }
    end
  end
end
