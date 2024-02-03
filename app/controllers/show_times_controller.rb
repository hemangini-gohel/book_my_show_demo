# frozen_string_literal: true

class ShowTimesController < ApplicationController
  before_action :set_movie

  def index
    @show_times = @movie.show_times
  end

  private

  def set_movie
    @movie = Movie.find(params[:movie_id])
  end
end
