class ProjectsController < ApplicationController
  before_action :logged_in_professor, only: [:create, :destroy]
  before_action :correct_professor,   only: :destroy

  def show
    @project = Project.find(params[:id])
  end

  def index
    @projects = Project.paginate(page: params[:page])
  end

  def new
    @project = Project.new
  end

  def create
    @project = current_professor.projects.build(project_params)
    if @project.save
      flash[:success] = "Projeto adicionado com sucesso"
      redirect_to projects_path
    else
      flash[:danger] = "Ops... os campos não foram preenchidos corretamente. Projeto não adicionado"
      redirect_to projects_path
    end
  end

  def destroy
    @project.destroy
    flash[:success] = "Projeto deletado"
    redirect_to request.referrer || root_url
  end

  private

    def project_params
      params.require(:project).permit(:name, :date_start, :date_finish, :fomento,
      									:local, :images, :description, :n_participants,
      									:v_volunteers, :v_bolsistas, :perfil_volunteers)
    end

    def correct_professor
      @project = current_professor.projects.find_by(id: params[:id])
      redirect_to projects_path if @project.nil?
    end
end