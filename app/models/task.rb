class Task
  
  def initialize(connection)
    @connection = connection
  end
  
  def list
    request_task = @connection.task.list
    tasks = request_task['tasks']['task'] 
  end
  
  def show(task_id)
    task = @connection.task.get :task_id => task_id
  end
  
  
end