class CollectLinesController < ApplicationController
  before_action :set_collect_line, only: [:show, :edit, :update, :destroy]

  # GET /collect_lines
  # GET /collect_lines.json
  def index
    @collect_lines = CollectLine.all
  end

  # GET /collect_lines/1
  # GET /collect_lines/1.json
  def show
  end

  # GET /collect_lines/new
  def new
    @collect_line = CollectLine.new
  end

  # GET /collect_lines/1/edit
  def edit
  end

  # POST /collect_lines
  # POST /collect_lines.json
  def create
    @collect_line = CollectLine.new(collect_line_params)

    respond_to do |format|
      if @collect_line.save
        format.html { redirect_to @collect_line, notice: 'Collect line was successfully created.' }
        format.json { render :show, status: :created, location: @collect_line }
      else
        format.html { render :new }
        format.json { render json: @collect_line.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /collect_lines/1
  # PATCH/PUT /collect_lines/1.json
  def update
    respond_to do |format|
      if @collect_line.update(collect_line_params)
        format.html { redirect_to @collect_line, notice: 'Collect line was successfully updated.' }
        format.json { render :show, status: :ok, location: @collect_line }
      else
        format.html { render :edit }
        format.json { render json: @collect_line.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /collect_lines/1
  # DELETE /collect_lines/1.json
  def destroy
    @collect_line.destroy
    respond_to do |format|
      format.html { redirect_to collect_lines_url, notice: 'Collect line was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_collect_line
      @collect_line = CollectLine.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def collect_line_params
      params.fetch(:collect_line, {})
    end
end
