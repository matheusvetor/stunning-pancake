module Api
  module V1
    class EmployeesController < ApplicationController
      before_action :authorize_access_request!
      before_action :set_employee, only: [:show, :update, :destroy]

      def index
        @employees = Employee.not_admin

        render json: @employees
      end

      def show
        render json: @employee
      end

      def create
        @employee = Employee.new(employee_params)

        if @employee.save
          render json: @employee, status: :created
        else
          render json: @employee.errors, status: :unprocessable_entity
        end
      end

      def update
        if @employee.update(employee_params)
          render json: @employee
        else
          render json: @employee.errors, status: :unprocessable_entity
        end
      end

      def destroy
        @employee.destroy
      end

      private
        def set_employee
          @employee = Employee.find(params[:id])
        end

        def employee_params
          params.require(:employee).permit(:name, :cpf, :pis, :position, :team, :email, :password)
        end
    end
  end
end
