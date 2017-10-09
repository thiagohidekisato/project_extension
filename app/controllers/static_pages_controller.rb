class StaticPagesController < ApplicationController
  add_breadcrumb "Página inicial", :root_path

  def home
  end

  def doubt
    add_breadcrumb "Dúvidas Frequentes"
  end

  def tutorials
    add_breadcrumb "Tutoriais"
  end

  def about
    add_breadcrumb "Dúvidas Frequentes"
  end
end
