class VotesController < ApplicationController
  before_filter :authenticate_user!
  def create
    @vote = Vote.where(link_id:params[:vote][:link_id], user_id: current_user.id).first
    if @vote
      @vote.up = params[:vote][:up]
      @vote.save
    else
      @vote = current_user.vites.create(vote_params)
    end
    #@vote = current_user.votes.create(vote_params)
    #puts "======================"
    #puts @vote.errors.inspect
    redirect_to :back
  end

  private
    def vote_params
      params.require(:vote).permit(:up, :link_id)
    end
end
