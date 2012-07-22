class SalesManagementsController < ApplicationController
  # GET /sales_managements
  # GET /sales_managements.json
  def index
    @category = params[:category]
    if !@category || @category.empty?
      respond_to do |format|
        format.html # index.html.erb
        return 
      end
    end
    logger.debug("category: #{@category}")
    case @category
    when "estate"
      @collection = Estate.all
    when "business"
    when "motor_vehicle"
    when "accommodation"
    else
      raise "Bad Category"
    end
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @collection }
    end
  end

  # GET /sales_managements/1
  # GET /sales_managements/1.json
  def show
    @sales_management = SalesManagement.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @sales_management }
    end
  end

  # GET /sales_managements/1/edit
  def edit
    @sales_management = SalesManagement.find(params[:id])
  end

  # POST /sales_managements
  # POST /sales_managements.json
  def create
    @sales_management = SalesManagement.new(params[:sales_management])

    respond_to do |format|
      if @sales_management.save
        format.html { redirect_to @sales_management, notice: 'Sales management was successfully created.' }
        format.json { render json: @sales_management, status: :created, location: @sales_management }
      else
        format.html { render action: "new" }
        format.json { render json: @sales_management.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /sales_managements/1
  # PUT /sales_managements/1.json
  def update
    @sales_management = SalesManagement.find(params[:id])

    respond_to do |format|
      if @sales_management.update_attributes(params[:sales_management])
        format.html { redirect_to @sales_management, notice: 'Sales management was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @sales_management.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sales_managements/1
  # DELETE /sales_managements/1.json
  def destroy
    @sales_management = SalesManagement.find(params[:id])
    @sales_management.destroy

    respond_to do |format|
      format.html { redirect_to sales_managements_url }
      format.json { head :no_content }
    end
  end
end
