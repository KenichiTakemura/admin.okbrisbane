class ContactsController < ApplicationController

  def index
    @contacts = Contact.order.page params[:page]
    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @contacts }
    end
  end

  def show
    @contact = Contact.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @contact }
    end
  end

  def edit
    @contact = Contact.find(params[:id])
  end

  def update
    @business_category = BusinessCategory.find(params[:id])
    respond_to do |format|
      if @business_category.update_attributes(params[:business_category])
        format.html { redirect_to @business_category, :notice => t("successfully_updated") }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @business_category.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @contact = Contact.find(params[:id])
    @contact.destroy
    respond_to do |format|
      format.html { redirect_to contacts_url }
      format.json { head :no_content }
    end
  end
end
