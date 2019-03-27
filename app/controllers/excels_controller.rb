class ExcelsController < ApplicationController
  respond_to :xlsx, :html
	before_action :authenticate_user!

	def index
    @ressource = ExcelClientsJob.perform_now(params[:ressource])
    respond_to do |format|
      format.html
      format.xlsx { render xlsx: :index, filename: "#{params[:ressource]}"}
    end
	end
end
