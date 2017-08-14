 class TweetsController < ApplicationController


    def index
    @tweets = Tweet.all.order("id DESC").page(params[:page]).per(5)

    end

    def new
    end

    def create
      Tweet.create(name: params[:name], image: params[:image], text: params[:text])
    end


   private
   def tweet_params
   params.permit(:name, :image, :text)
   end


 end
