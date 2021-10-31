module Api
  module V1
    class FlatsController < ApplicationController
      def index
        render json: Flat.all
      end

      def create
        neighborhood = Neighborhood.create!(neighborhood_params)
        flat = Flat.new(flat_params.merge(neighborhood_id: neighborhood.id))

        if flat.save
          render json: flat, status: :created
        else
          render json: flat.errors, status: :unprocessable_entity
        end
      end

      def update
        flat = Flat.find(params[:id])

        if flat.update(flat_params)
          render json: flat, status: :ok
        else
          render json: flat.errors, status: :unprocessable_entity
        end
      end

      def destroy
        Flat.find(params[:id]).destroy!

        head :no_content
      rescue ActiveRecord::RecordNotDestroyed
        render json:{}, status: :unprocessable_entity
      end

      private

      def neighborhood_params
        params.require(:neighborhood).permit(:name, :coordinate_range)
      end

      def flat_params
        params.require(:flat).permit(:name)
      end
    end
  end
end
