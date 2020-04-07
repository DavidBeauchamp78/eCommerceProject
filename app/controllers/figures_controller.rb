class FiguresController < ApplicationController
    def index
        @factions = Faction.all
        @figures = Figure.search(params[:faction], params[:search])
    end

    def show
        @figure = Figure.find(params[:id])
    end
end
