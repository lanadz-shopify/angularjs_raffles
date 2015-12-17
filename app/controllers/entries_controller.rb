class EntriesController < ApplicationController
  before_action :set_entry, except: [:index, :destroy, :create]
  before_action :set_default_response_format

  respond_to :json

  def index
    @entries = Entry.all
    respond_with @entries
  end

  def show
    respond_with @entry
  end

  def create
    @entry = Entry.create(entries_params)
    respond_with @entry
  end

  def update
    @entry.update(entries_params)
    respond_with @entry
  end

  def destroy
    @entry = Entry.destroy(params[:id])
    respond_with @entry
  end

  private

  def entries_params
    params.require(:entry).permit(:name, :winner)
  end

  def set_entry
    @entry = Entry.find(params[:id])
  end
end
