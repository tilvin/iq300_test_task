class ExportTasksController < ApplicationController

  def index
    @tasks = Task.all
    respond_to do |format|
      format.xlsx { render filename: "tasks #{ Date.today.strftime('%d.%m.%y') }.xlsx" }
    end
  end

end