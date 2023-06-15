class Admin::OrderHistoryDetailsController < ApplicationController

  before_action :authenticate_admin!, except: [:top,:about]

  def update


  end

end
