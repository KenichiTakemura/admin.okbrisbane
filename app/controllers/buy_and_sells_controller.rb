class BuyAndSellsController < PostsController

  @@management_path = "posts_managements"  

  def create
    _create(BuyAndSell, :buy_and_sell)
  end

  def update
    _update(BuyAndSell, :buy_and_sell)
  end
 
end