# frozen_string_literal: true

module Api
  module V1
    class ProjectsController < ApplicationController
      before_action :authenticate_request!
      before_action :set_project, only: %i[show update destroy]

      # GET /projects
      def index

        @projects = Project.where(user: params[:id])
        respond_to do |format|
        format.json {render json: @projects, status: :created}
        format.xml {render xml: @projects.as_json, status: :created}
        end
      end

      # GET /projects/1
      def show
        respond_to do |format|
          format.json {render json: @project}
          format.xml { render xml: @project.as_json }
        end
      end

      # POST /projects
      def create
        @project = Project.new(project_params)

        if @project.save
          render json: @project, status: :created
        else
          render json: @project.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /projects/1
      def update
        if @project.update(project_params)
          render json: @project, status: :created
        else
          render json: @project.errors, status: :unprocessable_entity
        end
      end

      # DELETE /projects/1
      def destroy
        @project.destroy
        render json: :created
          end

      private

      # Use callbacks to share common setup or constraints between actions.
      def set_project
        @project = Project.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def project_params
        params.require(:project).permit(:name, :description, :user_id)
      end
    end
end
end
