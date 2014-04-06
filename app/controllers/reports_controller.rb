class ReportsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :create_report, only: [:create]
  load_and_authorize_resource

  before_action :set_categories, only: [:new, :edit, :create, :update]

  # GET /reports
  # GET /reports.json
  def index
    @reports = @reports.includes(:user)
  end

  # GET /reports/1
  # GET /reports/1.json
  def show
  end

  # GET /reports/new
  def new
  end

  # GET /reports/1/edit
  def edit
  end

  # POST /reports
  # POST /reports.json
  def create
    @report.owner = current_user

    respond_to do |format|
      if @report.save
        format.html { redirect_to :reports, notice: 'Report was successfully created.' }
        format.json { render 'show', status: :created, location: @report }
      else
        format.html { render 'new' }
        format.json { render json: @report.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /reports/1
  # PATCH/PUT /reports/1.json
  def update
    respond_to do |format|
      if @report.update(report_params)
        format.html { redirect_to @report, notice: 'Report was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render 'edit' }
        format.json { render json: @report.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reports/1
  # DELETE /reports/1.json
  def destroy
    @report.destroy
    respond_to do |format|
      format.html { redirect_to reports_url }
      format.json { head :no_content }
    end
  end

  private

  def set_categories
    @categories = Category.all
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def report_params
    params.require(:report).permit(
      :title,
      :body,
      :slug,
      :category_id,
      pictures_attributes: [:id, :title, :file, :_destroy]
    )
  end

  def create_report
    @report = Report.new(report_params)
  end
end
