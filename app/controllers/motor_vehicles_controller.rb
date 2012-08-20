class MotorVehiclesController <  PostsController
  
  @@management_path = "sales_managements"
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
  
end
