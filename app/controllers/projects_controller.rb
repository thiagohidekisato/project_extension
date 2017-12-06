class ProjectsController < ApplicationController
  before_action :logged_in_professor, only: [:create, :destroy]
  before_action :correct_professor,   only: [:destroy, :edit, :update]
  add_breadcrumb "Página inicial", :root_path

  def show
    add_breadcrumb "Projetos", :projects_path
    add_breadcrumb "Visualização de Projeto"
    @project = Project.find(params[:id])
  end

  def index
    @projects = Project.paginate(page: params[:page])
    add_breadcrumb "Projetos"
  end

  def new
    add_breadcrumb "Cadastro de Novo Projeto"
    @project = Project.new
  end

  def edit
    add_breadcrumb "Alteração de Dados do Projeto"
    @project = Project.find(params[:id])
  end

  def update
    @project = Project.find(params[:id])
    if @project.update_attributes(project_params)
      flash[:success] = "Projeto atualizado"
      redirect_to @project
    else
      render 'edit'
    end
  end

  def create
    @project = current_professor.projects.build(project_params)
    if @project.save
      flash[:success] = "Projeto adicionado com sucesso"
      redirect_to projects_path
    else
      flash[:danger] = "Ops... os campos não foram preenchidos corretamente. Projeto não adicionado"
      render 'new'
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
      									:local, :description, :n_participants,
      									:v_volunteers, :v_bolsistas, :perfil_volunteers, :picture)
    end

    def correct_professor
      @project = current_professor.projects.find_by(id: params[:id])
      redirect_to projects_path if @project.nil?
    end

end
