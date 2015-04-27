class PostulationsController < ApplicationController
  def index
    @postulations = Postulations.all
  end
end
