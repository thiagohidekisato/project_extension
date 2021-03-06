class StaticPagesController < ApplicationController
  add_breadcrumb "Página inicial", :root_path

  def home
    @projects = Project.all
  end

  def doubt
    add_breadcrumb "Dúvidas Frequentes"
  end

  def tutorials
    add_breadcrumb "Tutoriais"
  end

  def about
    add_breadcrumb "Sobre"
  end

end
