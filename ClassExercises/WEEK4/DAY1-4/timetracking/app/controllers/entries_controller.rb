class EntriesController < ApplicationController
  def index
    @project=Project.find_by(id: params[:project_id])
    @entries=@project.entries

    date=Date.today
    @current_month_hours=@project.total_hours_in_month(date.month, date.year)
  end

  def new
    @project=Project.find_by(id: params[:project_id])
    @entry=@project.entries.new
  end

  def create
    #Find the project
    @project=Project.find params[:project_id]
    #New entry
    @entry=@project.entries.new(entry_params) #Le pasamos el "pack completo" y se encarga de hacer el match
    #Try to save it
    if @entry.save
        flash[:notice] = "Entry created successfully"
        redirect_to action: :index, project_id: @project.id
    else
      flash[:alert]="Something goes wrong"
      render 'new'
    end
  end

  def edit
    @project=Project.find_by(id: params[:project_id])
    @entry=@project.entries.find(params[:id])
  end

  def update
    @entry=Entry.find(params[:id])
    if @entry.update_attributes entry_params
      redirect_to action: :index
    else
      render 'edit'
    end
  end

  #Evitamos repetir esta linea en create, new, index, edit...Asi la llamamos
  #sólo 1 vez a la BBDD
  # def project
  #   @project ||= Project.find params[:project_id]
  # end

  def destroy
    project = Project.find(params[:project_id])
    entry=project.entries.find(params[:id])
    entry.destroy

    redirect_to action: :index, id: project.id
  end


  private
  def entry_params
    params.require(:entry).permit(:hours, :minutes, :date)
    #Nos aseguramos que haya una key "entry" y si la hay esas keys de permit
  end

end
