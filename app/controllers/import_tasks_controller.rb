class ImportTasksController < ApplicationController

  def index
    redirect_to new_import_task_path
  end

  def new
  end

  def create
    file = params[:task][:file]
    table = Roo::Spreadsheet.open(file.path)
    row_count = table.last_row
    @errors = []
    @successes = []
    (2..row_count).each do |n|
      row = table.row(n)
      task = Task.create(name: row[0], started_at: row[1], ended_at: row[2])
      if task.persisted?
        @successes << [n, row[0]]
      elsif task.errors.any?
        @errors << [n, row[0], task.errors.full_messages ]
      end
    end
    render :new
  end
end