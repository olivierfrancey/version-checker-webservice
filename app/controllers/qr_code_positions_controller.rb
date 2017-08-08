class QrCodePositionsController < ApplicationController
  before_action :set_qr_code_position, only: [:show, :edit, :update, :destroy]

  # GET /qr_code_positions
  # GET /qr_code_positions.json
  def index
    @qr_code_positions = QrCodePosition.all
  end

  # GET /qr_code_positions/1
  # GET /qr_code_positions/1.json
  def show
  end

  # GET /qr_code_positions/new
  def new
    @qr_code_position = QrCodePosition.new
  end

  # GET /qr_code_positions/1/edit
  def edit
  end

  # POST /qr_code_positions
  # POST /qr_code_positions.json
  def create
    @qr_code_position = QrCodePosition.new(qr_code_position_params)
    @qr_code_position.user = current_user

    respond_to do |format|
      if @qr_code_position.save
        format.html { redirect_to @qr_code_position, notice: 'Qr code position was successfully created.' }
        format.json { render :show, status: :created, location: @qr_code_position }
      else
        format.html { render :new }
        format.json { render json: @qr_code_position.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /qr_code_positions/1
  # PATCH/PUT /qr_code_positions/1.json
  def update
    respond_to do |format|
      if @qr_code_position.update(qr_code_position_params)
        format.html { redirect_to @qr_code_position, notice: 'Qr code position was successfully updated.' }
        format.json { render :show, status: :ok, location: @qr_code_position }
      else
        format.html { render :edit }
        format.json { render json: @qr_code_position.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /qr_code_positions/1
  # DELETE /qr_code_positions/1.json
  def destroy
    @qr_code_position.destroy
    respond_to do |format|
      format.html { redirect_to qr_code_positions_url, notice: 'Qr code position was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_qr_code_position
      @qr_code_position = QrCodePosition.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def qr_code_position_params
      params.require(:qr_code_position).permit(:page, :x, :y, :size, :name)
    end
end
