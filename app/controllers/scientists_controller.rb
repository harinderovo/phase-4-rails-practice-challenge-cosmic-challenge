class ScientistsController < ApplicationController
    before_action :find_scientist, only: [:show, :destroy] 

    def index
        render json: Scientist.all, status: :ok
    end

    def show
        render json: @scientist, serializer: SingleScientistSerializer, status: :ok
    end

    def create 
        new_scientist = Scientist.create!(scientist_params)
        render json: new_scientist, status: :created
    end

    # def update
    #     render json: Scientist.update!(scientist_params), status: :accepted
    # end

    def update 
        scientist = Scientist.find(params[:id])
        scientist.update!(scientist_params)
        render json: scientist, status: 202
    end

    def destroy
        scientist = Scientist.find(params[:id])
        scientist.destroy
        head :no_content
    end

    private 

    def find_scientist
        @scientist = Scientist.find(params[:id])
    end

    def scientist_params
        params.permit(:id, :name, :field_of_study, :avatar)
    end

end
