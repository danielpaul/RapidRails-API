module ApiResponder
  extend ActiveSupport::Concern

  def render_success(data = {}, status: :ok, message: nil, meta: nil)
    response = { success: true, data: data }
    response[:message] = message if message
    response[:meta] = meta if meta
    render json: response, status: status
  end

  def render_error(errors, status: :unprocessable_entity, message: nil)
    response = { success: false, errors: errors }
    response[:message] = message if message
    render json: response, status: status
  end
end
