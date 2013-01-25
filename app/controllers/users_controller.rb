class UsersController < MembersController

  def index
    _index(User)
  end

  def show
    _show(User)
  end

  def destroy
    _destroy(User)
  end
  
  def clean_image
    @user = _clean_image(User)
    respond_to do |format|
      format.html { redirect_to @user }
      format.json { head :no_content }
    end
  end

  def clean_attachment
   @user = _clean_attachment(User)
   respond_to do |format|
      format.html { redirect_to @user }
      format.json { head :no_content }
    end
  end
  
  def block_user
    @user = _block_user(User)
    respond_to do |format|
      format.html { redirect_to @user }
      format.json { head :no_content }
    end
  end

  def unblock_user
    @user = _unblock_user(User)
    respond_to do |format|
      format.html { redirect_to @user }
      format.json { head :no_content }
    end
  end
end
