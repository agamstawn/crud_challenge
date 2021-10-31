module Api
  module V1
    class NeighborhoodsController < ApplicationController
      def index
        render json: Neighborhood.all
      end

      def create
        neighborhood = Neighborhood.new(neighborhood_params)

        if neighborhood.save
          render json: neighborhood, status: :created
        else
          render json: neighborhood.errors, status: :unprocessable_entity
        end
      end

      def update
        neighborhood = Neighborhood.find(params[:id])

        if neighborhood.update(neighborhood_params)
          render json: neighborhood, status: :ok
        else
          render json: neighborhood.errors, status: :unprocessable_entity
        end
      end

      def destroy
        Neighborhood.find(params[:id]).destroy!

        head :no_content
      rescue ActiveRecord::RecordNotDestroyed
        render json:{}, status: :unprocessable_entity
      end

      private

      def neighborhood_params
        params.require(:neighborhood).permit(:name, :coordinate_range)
      end
    end
  end
end
