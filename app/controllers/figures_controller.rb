class FiguresController < ApplicationController
    def index
        @figures = Figure.all
    end
end
