class DynamicPagesController < ApplicationController
  def search
    if !(params[:search].eql? "")
      @dynamic_pages = PgSearch.multisearch(params[:search]).paginate(page: params[:page])
    else
      @dynamic_pages = Project.paginate(page: params[:page])
    end
  end
end
