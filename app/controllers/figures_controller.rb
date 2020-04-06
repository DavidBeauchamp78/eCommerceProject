class FiguresController < ApplicationController
    def index
        @figures = Figure.all
    end

    def show
        @figure = Figure.find(params[:id])
    end
end
