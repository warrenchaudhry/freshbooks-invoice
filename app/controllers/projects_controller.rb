class ProjectsController < ApplicationController
  layout 'main'
  require "net/http"
  require "uri"
  require 'httparty'
  def index
    token = APP_VARS[:ws_token]
    @my_project = Project.new(token)
    @project = @my_project.get
    @user = @my_project.user
    @time_entries = @my_project.get_time_entries(@project['id'], @user['id'])
    @task = @my_project.get_task_name(@project['id'], 59843)
    # if @time_entries.nil?
      # @total_mins = 0
    # else
      # @total_mins = @time_entries.inject(0) {|sum, x| sum + x['duration_in_minutes'].to_i }
    # end
    
    render :xml => @time_entries
    
  end
  
  def show_entry
    token = APP_VARS[:ws_token]
    my_project = Project.new(token)
    time_entry = my_project.get_entry(params[:project_id], params[:time_entry_id])
    render :xml => time_entry   
  end
end
