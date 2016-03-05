class ProjectsController < ApplicationController

  #LISTADO DE TODOS LOS PROYECTOS!!
  def index
    #projects = Project.last(10) #Este método nos saca los ultimos 10 IDs
    @projects = Project.last_created_projects(10)


    #Esto es para indicar que la description está vacía
    # @projects.each do |pro|
    #   if pro.description===""
    #     pro.description="(vacior)"
    #   end
    # end

    if @projects.empty?
      render template: 'site/no_projects'
    end
  end


  #DETALLE PROYECTO!!
  def show
    #METODO 2 - Usnado el método genérico render_404
    @project=Project.find_by(id: params[:id]) || render_404(params)
    @current_month_hours=@project.project_total_hours

    #METODO 1
    #@project=Project.find params[:id]
    # rescue ActiveRecord::RecordNotFound
    # render 'no_projects_found'
  end

  #ME LO LLEVO AL ApplicationController PARA QUE SEA ACCESIBLE POR OTROS CONTROLLERS
  # def render_404(params)
  #   Rails.logger.warn("Tried to access #{params} which did not exist.")
  #   render "layouts/404"
  # end

end
