class FiguresController < ApplicationController
    # def create
    #     figure = Figure.create!(figure_params)
    #     figure.image.attach(params[:image])
    # end

    # def edit
    #     self.update(figure_params)
    #     self.image.attach(params[:image])
    # end
    
    def index
        @factions = Faction.all.page(params[:page])
        @figures = Figure.search(params[:faction], params[:search]).page(params[:page])
    end

    def show
        @figure = Figure.find(params[:id])
    end

    def add_to_cart
        id = params[:id]

        session[:cart].store(id, 1)
        
        redirect_to '/figures'
    end

    def remove_from_cart
        id = params[:id]

        session[:cart].delete(id)

        redirect_to '/pages/cart'
    end

    def increase_quantity
        id = params[:id]

        session[:cart][id] += 1

        redirect_to '/pages/cart'
    end

    def decrease_quantity
        id = params[:id]

        session[:cart][id] -= 1

        redirect_to '/pages/cart'
    end
    #     def figure_params
    #         params.require(:name, :description, :price, :faction).permit(:image)
    #     end
end
