# frozen_string_literal: true

class HomeController < ApplicationController
  def index
    @user = User.all
    @event = Event.all
    @events_last = Event.order('created_at DESC')[0..3]
    puts '$' * 200
    puts 'params'
    # @events_landing = events_last
  end
end
