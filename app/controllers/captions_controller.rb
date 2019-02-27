class CaptionsController < ApplicationController
    def index
        @captions = Caption.all
    end
    def new
        @caption = Caption.new
    end

    def create
        @caption = Caption.new(caption_params)
        @caption.votes = 0
        @caption.save
        redirect_to @caption
    end
    def show
        @caption = Caption.find(params[:id])
    end

    private
        def caption_params
            params.require(:caption).permit(:imgurl, :captioner, :caption, :votes)
        end
end
