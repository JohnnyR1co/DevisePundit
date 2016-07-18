class PagesController < ApplicationController
  def home
  end

  def address
    authorize :pages, :address?
  end
end
