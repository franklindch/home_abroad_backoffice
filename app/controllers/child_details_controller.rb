class ChildDetailsController < ApplicationController
	before_action :authenticate_user!
	before_action :retrieve_child_detail, only: [:edit, :update, :destroy, :show]
	before_action :retrieve_qualification, only: [:edit, :update, :destroy, :show]
	
	def edit
		
	end

	def update
		
	end

	private

	def retrieve_qualification
	  @qualification = Qualification.find(params[:qualification_id])
	end
end
