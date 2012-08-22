class MotorVehiclesController <  PostsController
  
  @@management_path = "sales_managements"

  def create
    _create(MotorVehicle, :motor_vehicle)
  end

  def update
    _update(MotorVehicle, :motor_vehicle)
  end
  
end
