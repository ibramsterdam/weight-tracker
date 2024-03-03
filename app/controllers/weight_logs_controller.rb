class WeightLogsController < ApplicationController
  before_action :set_weight_log, only: %i[ show edit update destroy ]
  before_action :authenticate_user!

  # GET /weight_logs or /weight_logs.json
  def index
    @weight_logs = WeightLog.all
  end

  # GET /weight_logs/1 or /weight_logs/1.json
  def show
  end

  # GET /weight_logs/new
  def new
    @weight_log = WeightLog.new
  end

  # GET /weight_logs/1/edit
  def edit
  end

  # POST /weight_logs or /weight_logs.json
  def create
    @weight_log = WeightLog.new(weight_log_params)
    @weight_log.user_id = current_user.id

    respond_to do |format|
      if @weight_log.save
        format.html { redirect_to weight_log_url(@weight_log), notice: "Weight log was successfully created." }
        format.json { render :show, status: :created, location: @weight_log }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @weight_log.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /weight_logs/1 or /weight_logs/1.json
  def update
    respond_to do |format|
      if @weight_log.update(weight_log_params)
        format.html { redirect_to weight_log_url(@weight_log), notice: "Weight log was successfully updated." }
        format.json { render :show, status: :ok, location: @weight_log }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @weight_log.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /weight_logs/1 or /weight_logs/1.json
  def destroy
    @weight_log.destroy!

    respond_to do |format|
      format.html { redirect_to weight_logs_url, notice: "Weight log was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_weight_log
      @weight_log = WeightLog.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def weight_log_params
      params.require(:weight_log).permit(:weight, :measured_at, :user_id)
    end
end
