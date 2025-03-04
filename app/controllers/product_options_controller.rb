class ProductOptionsController < ApplicationController
  before_action :set_product_option, only: %i[show update destroy]

  def index
    begin
      @product_option = ProductOption.all

      render json: JsonApiResponse.render(
          data: @product_option,
        status: 200
      )

    rescue StandardError => e
      render json: JsonApiResponse.render(
        success: false,
        errors: [ e.message ],
        status: 500
      )
    end
  end

  def create
    @product_option = ProductOption.new(product_options_params)

    if @product_option.save
      render json: JsonApiResponse.render(
        data: @product_option,
        status: 200
      )
    else
      render json: JsonApiResponse.render(
        errors: @product_option.errors,
        status: 422
      )
    end
  end

  def show
  end

  def update
  end

  def destroy
  end

  private

  def set_product_option
    @product_option = ProductOption.find(params.expect(:id))
  end

  def product_options_params
    params.permit([ :name, :description ])
  end
end
