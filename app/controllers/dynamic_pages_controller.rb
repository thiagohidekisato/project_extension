class DynamicPagesController < ApplicationController

  add_breadcrumb "Página inicial", :root_path

  def search
      add_breadcrumb "Resultados da Pesquisa"
    if !(params[:search].eql? "")
      @dynamic_pages = PgSearch.multisearch(params[:search]).paginate(page: params[:page])
    else
      @dynamic_pages = Project.paginate(page: params[:page])
    end
  end
end
