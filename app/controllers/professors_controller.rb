class ProfessorsController < ApplicationController
  before_action :logged_in_professor, only: [:edit, :update, :destroy]
  before_action :correct_professor,   only: [:edit, :update]
  before_action :admin_professor,     only: :destroy
  add_breadcrumb "Página inicial", :root_path

  def show
    add_breadcrumb "Professores", :professors_path
    add_breadcrumb "Visualização de Professor"
    @professor = Professor.find(params[:id])
    @projects = @professor.projects.paginate(page: params[:page])
  end

  def new
    add_breadcrumb "Cadastro de professores"
    @professor = Professor.new
  end

  def create
    @professor = Professor.new(professor_params)    # Not the final implementation!
    if @professor.save
      log_in @professor
      flash[:success] = "Cadastro realizado com sucesso!"
      redirect_to @professor
    else
      render 'new'
    end
  end

  def edit
    add_breadcrumb "Alteração de Dados do Cadastro"
    @professor = Professor.find(params[:id])
  end

  def update
    @professor = Professor.find(params[:id])
    if @professor.update_attributes(professor_params)
      flash[:success] = "Perfil atualizado"
      redirect_to @professor
    else
      render 'edit'
    end
  end

  def index
      add_breadcrumb "Professores"
    @professors = Professor.paginate(page: params[:page])
  end

  def destroy
    Professor.find(params[:id]).destroy
    flash[:success] = "Professor deletado"
    redirect_to professors_url
  end

  private

    def professor_params
      params.require(:professor).permit(:name, :email, :phone, :ramal, :phone_cel,
      				:specialization, :room, :lattes, :password, :password_confirmation)
    end

    # Confirms the correct user.
    def correct_professor
      @professor = Professor.find(params[:id])
      redirect_to(root_url) unless current_professor?(@professor)
    end

    # Confirms an admin user.
    def admin_professor
      redirect_to(root_url) unless current_professor.admin?
    end
end
