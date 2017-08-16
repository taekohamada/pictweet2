 class TweetsController < ApplicationController


    def index
    @tweets = Tweet.all.order("id DESC").page(params[:page]).per(4)

    end

    def new
    end

    def create
      Tweet.create(name: params[:name], image: params[:image], text: params[:text])
    end


   def destroy
    @tweet = Tweet.find(params[:id])
   end

   def edit
    tweet = Tweet.find(params[:id])
    if tweet.user_id == current_user.id
      tweet.edit
    end

 end

   private
   def tweet_params
   params.permit(:name, :image, :text)
   end

  def move_to_index
   redirect_to action: :index unless user_signed_in?
   end

end
