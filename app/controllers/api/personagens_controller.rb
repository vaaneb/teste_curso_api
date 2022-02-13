class Api::PersonagensController < ApplicationController
  before_action :set_personagem, only: %i[ show update destroy ]

  # GET /personagens
  def index
    @personagens = Personagem.all.sorted_by_name

    render json: @personagens
  end

  # GET /personagens/1
  def show
    render json: @personagem
  end

  # POST /personagens
  def create
    @personagem = Personagem.new(personagem_params)

    if @personagem.save
      render json: @personagem, status: :created, location: @personagem
    else
      render json: @personagem.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /personagens/1
  def update
    if @personagem.update(personagem_params)
      render json: @personagem
    else
      render json: @personagem.errors, status: :unprocessable_entity
    end
  end

  # DELETE /personagens/1
  def destroy
    @personagem.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_personagem
      @personagem = Personagem.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def personagem_params
      params.require(:personagem).permit(:name)
    end
end
