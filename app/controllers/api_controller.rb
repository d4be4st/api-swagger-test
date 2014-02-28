class ApiController < ApplicationController
  def docs
    @version = params[:version]
  end
end
