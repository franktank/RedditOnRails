class PagesController < ApplicationController
  #before_filter :authenticate_user!
  def index
    @links = Link.all
    @links = Link.paginate(:page => params[:page], :per_page => 3)
    Vote.find_each {|vote| vote.destroy unless vote.valid? }
  end
end
