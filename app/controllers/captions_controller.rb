class CaptionsController < ApplicationController
    def index
        @captions = Caption.all.sort_by{ |a| a[:votes]}.reverse
    end
    def new
        @caption = Caption.new
    end

    def create
        @caption = Caption.new(caption_params)
        @caption.votes = 0
        @caption.save
        redirect_to captions_path
    end
    def show
        @caption = Caption.find(params[:id])
    end
    def edit
        @caption = Caption.find(params[:id])
    end
    def update
        @caption = Caption.find(params[:id])
        if @caption.update(caption_params)
            redirect_to captions_path
        else
            render 'edit'
        end
    end
    def destroy
        @caption = Caption.find(params[:id])
        @caption.destroy

        redirect_to captions_path
    end
    def increment_vote
        @caption = Caption.find(params[:id])
        @caption.update_attribute(:votes, @caption.votes + 1)

        redirect_to captions_path
    end
    def decrement_vote
        @caption = Caption.find(params[:id])
        @caption.update_attribute(:votes, @caption.votes - 1)

        redirect_to captions_path
    end

    private
        def caption_params
            params.require(:caption).permit(:imgurl, :captioner, :caption, :votes)
        end
end
