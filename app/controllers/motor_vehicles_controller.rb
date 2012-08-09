class MotorVehiclesController <  PostsController
  
  @@management_path = "sales_managements"
  def new
    _new(MotorVehicle)
  end
  
  def show
    _show(MotorVehicle)
  end
  
  def create
    _create(MotorVehicle, :motor_vehicle)
  end
  
  def edit
    _edit(MotorVehicle)
  end
  
  def update
    _update(MotorVehicle, :motor_vehicle)
  end
  
  def destroy
    _destroy(MotorVehicle)
  end
  
  # ajax request
  def upload
    _upload(MotorVehicle)
  end
  
end
