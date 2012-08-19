class OkadminsController< MembersController
  def index
    _index(Admin)
  end

  def show
    _show(Admin)
  end
  
  def destroy
    _destroy(Admin)
  end
  
  def clean_image
    @user = _clean_image(Admin)
    respond_to do |format|
      format.html { redirect_to okadmin_path(@user) }
      format.json { head :no_content }
    end
  end

  def clean_attachment
   @user = _clean_attachment(Admin)
   respond_to do |format|
      format.html { redirect_to okadmin_path(@user) }
      format.json { head :no_content }
    end
  end

end
