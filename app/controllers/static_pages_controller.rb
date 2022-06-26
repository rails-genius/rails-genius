# frozen_string_literal: true

class StaticPagesController < ApplicationController
  def index
    render Static::HomePage
  end
end
