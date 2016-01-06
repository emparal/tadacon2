class ProjectsController < ApplicationController

	  before_action :find_project, only: [:show,:edit,:update, :destroy]

	def index
	 @project= Project.all.order("created_at DESC")
	end

	def new
		@project = Project.new
	end

	def create
		@project = Project.new(project_params)
		if @project.save
			redirect_to @project
		else
			render 'new'
		end
	end

	def show
	end

	def update
		if @project.update(project_params)
			redirect_to @project
		else
			render 'edit'
		end
	end

	def destroy
		@project.destroy
		redirect_to root_path, notice: "Succefully deleted the project!!!"
	end

	def edit
	end



	private

	def find_project
		@project = Project.find(params[:id])
	end

	def project_params
		params.require(:project).permit(:name, :description,:location,:image)
	end


end
