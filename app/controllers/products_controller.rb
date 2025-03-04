class ProductsController < ApplicationController
  Rails.application.routes.default_url_options[:host] = "localhost:3000"
  before_action :set_product, only: %i[ show update destroy ]

  # GET /products
  def index
    begin
      # @products = Product.with_attached_images
      #                   .includes(:category, :supplier, :reviews)
      #                   .all
      @products = Product.with_attached_images.all

      render json: JsonApiResponse.render(
        data: @products,
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

  # GET /products/1
  def show
    render json: JsonApiResponse.render(
      data: @product,
      status: 200
    )
  end

  # POST /products
  def create
    @product = Product.new(product_params)

    if @product.save
      render json: JsonApiResponse.render(
        data: @product,
        status: 200
      )
    else
      render json: JsonApiResponse.render(
        errors: @product.errors,
        status: 422
      )
    end
  end

  # PATCH/PUT /products/1
  def update
    if @product.update(product_params)
      render json: JsonApiResponse.render(
        data: @product,
        status: 200
      )
    else
      render json: JsonApiResponse.render(
      errors: @product.errors,
      status: 422
    )
    end
  end

  # DELETE /products/1
  def destroy
    @product.destroy!
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def product_params
      params.permit([ :name, :description, :price, :quantity_available, :restock_level, :disabled_at, :images ])
    end
end
