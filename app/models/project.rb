class Project
  include HTTParty
  require 'date'
  
  
  def initialize(token)
    @auth = {:username => token}
  end
  
  def get
    api_url = 'http://www.worksnaps.net/api/projects.xml'
    req = self.class.get(api_url, {:basic_auth => @auth})
    parsed_data = req.parsed_response
    if parsed_data.is_a?(Array)
      @project = parsed_data['projects']['project'][0]
    else
      @project = parsed_data['projects']['project']  
    end
    
    #return nil if parsed_data['projects'].nil?
  end
  
  def user
    api_url = 'http://www.worksnaps.net/api/me.xml'
    req = self.class.get(api_url, {:basic_auth => @auth})
    parsed_data = req.parsed_response
    @user = parsed_data['user'] #id = 8514
    
    
  end
  
  def get_time_entries
    start_time_stamp = Date.today.to_time.to_i
    end_time_stamp = (Date.today + 2).to_time.to_i

    api_url = "http://www.worksnaps.net/api/projects/#{@project['id']}/users/#{@user['id']}/time_entries.xml?from_timestamp=#{start_time_stamp}&to_timestamp=#{end_time_stamp}"
    req = self.class.get(api_url, {:basic_auth => @auth})
    parsed_data = req.parsed_response['time_entries']['time_entry']    
  end
  
  def get_task_name(project_id, task_id)
    api_url = "http://www.worksnaps.net/api/projects/#{project_id}/tasks/#{task_id}.xml"
    req = self.class.get(api_url, {:basic_auth => @auth})
    parsed_data = req.parsed_response
    task = parsed_data['task']
    return task['name']
  end
  
  def get_entry(project_id, entry_id)
    api_url = "http://www.worksnaps.net/api/projects/#{project_id}/time_entries/#{entry_id}.xml"
    req = self.class.get(api_url, {:basic_auth => @auth})
    parsed_data = req.parsed_response['time_entry']
  end
end