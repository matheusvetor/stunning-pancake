class ApplicationController < ActionController::API
  include JWTSessions::RailsAuthorization
  rescue_from JWTSessions::Errors::Unauthorized, with: :not_authorized

  private

  def not_authorized
    render json: { error: 'Not Authorized' }, status: :unauthorized
  end

  def current_employee
    @current_employee ||= Employee.find(payload['employee_id'])
  end

  def not_authorized
    render json: { error: 'Não autorizado' }, status: :unauthorized
  end
end
