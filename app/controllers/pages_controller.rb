class PagesController < ApplicationController
  before_filter :authenticate_user!
  before_filter :prepare_page, :only => [ :show, :edit, :update, :destroy ]

  def new
    @page = Page.new
  end

  def index
    @pages = Page.all
  end

  def show
  end

  def edit
  end

  def update
    @page.update_attributes(params[:page])
    respond_with @page
  end

  def create
    @page = Page.create(params[:page])
    respond_with @page
  end

  def destroy
    @page.destroy
    respond_with @page
  end

  private

  def prepare_page
    @page = Page.find(params[:id])
  end
end
