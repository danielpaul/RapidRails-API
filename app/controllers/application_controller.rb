class ApplicationController < ActionController::API
  include Pagy::Backend
  include ApiResponder
end
