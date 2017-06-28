class SessionsController < ApplicationController
  def new
  end

  def create
    professor = Professor.find_by(email: params[:session][:email].downcase)
    if professor && professor.authenticate(params[:session][:password])
      log_in professor
      flash[:success] = 'Login realizado com sucesso'
      redirect_to professor
    else
      flash.now[:danger] = 'E-mail ou senha inválidos'
      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to root_url
  end

end
