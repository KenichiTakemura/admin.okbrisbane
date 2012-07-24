class BusinessesController < EstatesController
  
  def new
    _new(Business)
  end
  
  def create
    _create(Business)
  end
  
end
