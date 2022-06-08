class TapiceriaController < ApplicationController
  before_action :set_tapicerium, only: %i[ show edit update destroy ]

  # GET /tapiceria or /tapiceria.json
  def index
    @tapiceria = Tapicerium.all
  end

  # GET /tapiceria/1 or /tapiceria/1.json
  def show
  end

  # GET /tapiceria/new
  def new
    @tapicerium = Tapicerium.new
  end

  # GET /tapiceria/1/edit
  def edit
  end

  # POST /tapiceria or /tapiceria.json
  def create
    @tapicerium = Tapicerium.new(tapicerium_params)

    respond_to do |format|
      if @tapicerium.save
        format.html { redirect_to tapicerium_url(@tapicerium), notice: "Tapicerium was successfully created." }
        format.json { render :show, status: :created, location: @tapicerium }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @tapicerium.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tapiceria/1 or /tapiceria/1.json
  def update
    respond_to do |format|
      if @tapicerium.update(tapicerium_params)
        format.html { redirect_to tapicerium_url(@tapicerium), notice: "Tapicerium was successfully updated." }
        format.json { render :show, status: :ok, location: @tapicerium }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @tapicerium.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tapiceria/1 or /tapiceria/1.json
  def destroy
    @tapicerium.destroy

    respond_to do |format|
      format.html { redirect_to tapiceria_url, notice: "Tapicerium was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tapicerium
      @tapicerium = Tapicerium.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def tapicerium_params
      params.require(:tapicerium).permit(:nombre, :precio, :image)
    end
end
