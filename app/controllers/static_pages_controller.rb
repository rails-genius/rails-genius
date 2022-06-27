# frozen_string_literal: true

# Static pages
class StaticPagesController < ApplicationController
  # GET /
  def index
    render Static::HomePage
  end
end
