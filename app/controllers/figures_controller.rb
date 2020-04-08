class FiguresController < ApplicationController
    
    def create
        figure = Figure.create!(figure_params)
        figure.image.attach(params[:image])
    end

    def edit
        self.update(figure_params)
        self.image.attach(params[:image])
    end
    
    def index
        @factions = Faction.all
        @figures = Figure.search(params[:faction], params[:search])
    end

    def show
        @figure = Figure.find(params[:id])
    end

    private
        def figure_params
            params.require(:name, :description, :price, :faction).permit(:image)
        end
end
