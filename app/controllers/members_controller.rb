class MembersController < ApplicationController
  def _index(model)
    @users = model.all
    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @users }
    end
  end

  def _show(model)
    @user = model.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @user }
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def _destroy(model)
    @user = model.find(params[:id])
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :no_content }
    end
  end
  
  def _clean_image(model)
    user = model.find(params[:id])
    images = user.unattached_image
    images.each do |i|
      i.destroy
    end
    user
  end

  def _clean_attachment(model)
    user = model.find(params[:id])
    attachments = user.unattached_attachment
    attachments.each do |i|
      i.destroy
    end
    user
  end
  
  def _block_user(model)
    user = model.find(params[:id])
    user.update_attribute(:locked_at, Common.current_time) 
    logger.info("User is locked. #{user}")
    user
  end
  
  def _unblock_user(model)
    user = model.find(params[:id])
    user.update_attribute(:locked_at, nil) 
    logger.info("User is unlocked. #{user}")
    user
  end 


end
