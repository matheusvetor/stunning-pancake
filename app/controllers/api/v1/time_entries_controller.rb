module Api
  module V1
    class TimeEntriesController < ApplicationController
      before_action :authorize_access_request!
      before_action :set_employee
      before_action :set_time_entry, only: [:show, :update, :destroy]

      def index
        @time_entries = @employee.time_entries

        render json: @time_entries
      end

      def show
        render json: @time_entry
      end

      def create
        @time_entry = @employee.time_entries.new(time_entry_params)

        if @time_entry.save
          render json: @time_entry, status: :created
        else
          render json: @time_entry.errors, status: :unprocessable_entity
        end
      end

      def update
        if @time_entry.update(time_entry_params)
          render json: @time_entry
        else
          render json: @time_entry.errors, status: :unprocessable_entity
        end
      end

      def destroy
        @time_entry.destroy
      end

      private
        def set_employee
          @employee = Employee.find(params[:employee_id])
        end

        def set_time_entry
          @time_entry = @employee.time_entries.find(params[:id])
        end

        def time_entry_params
          params.require(:time_entry).permit(:entry)
        end
    end
  end
end
