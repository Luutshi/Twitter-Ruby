class LikesController < ApplicationController
    def create
        @like = current_user.likes.new(like_params)
        
        if !@like.save
            flash[:notice] = @like.errors.full_messages.to_sentence
        end

        redirect_to root_path
    end

    def destroy
        @like = current_user.likes.find(params[:id])
        @like.destroy
        redirect_to root_path
    end

    private

    def like_params
        puts ' '
        puts ' '
        puts params
        puts ' '
        puts ' '

        params.require(:like).permit(:tweet_id)
    end
end
