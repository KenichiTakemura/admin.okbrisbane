class BuyAndSellsController < PostsController

  @@management_path = "posts_managements"  
  def new
    _new(BuyAndSell)
  end
  
  def show
    _show(BuyAndSell)
  end
    
  def create
    _create(BuyAndSell, :buy_and_sell)
  end
  
  def edit
    _edit(BuyAndSell)
  end
  
  def update
    _update(BuyAndSell, :buy_and_sell)
  end
  
  def destroy
    _destroy(BuyAndSell)
  end
 
  # ajax request
  def upload
    _upload(BuyAndSell)
  end
  
end