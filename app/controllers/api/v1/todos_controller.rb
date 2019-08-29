# frozen_string_literal: true

module Api
  module V1
    class TodosController < ApplicationController
      before_action :authenticate_request!
      before_action :set_todo, only: %i[show update destroy]

      # GET /todos
      def index
        @todos = Todo.where(project: params[:id]).order(completed: :asc)
        respond_to do |format|
        format.json {render json: @todos, status: :created}
        format.xml {render xml: @todos.as_json, status: :created}
        end
      end

      # GET /todos/1
      def show
        respond_to do |format|
          format.json {render json: @todo, status: :created}
          format.xml { render xml: @todo.as_json, status: :created }
        end
      end

      # POST /todos
      def create
        @todo = Todo.new(todo_params)

        if @todo.save
          render json: @todo, status: :created
        else
          render json: @todo.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /todos/1
      def update
        if @todo.update(todo_params)
          render json: @todo, status: :created
        else
          render json: @todo.errors, status: :unprocessable_entity
        end
      end

      # DELETE /todos/1
      def destroy
        @todo.destroy
        render json: :created
      end

      private

      # Use callbacks to share common setup or constraints between actions.
      def set_todo
        @todo = Todo.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def todo_params
        params.require(:todo).permit(:name, :note, :completed, :project_id)
      end
    end
end
end
