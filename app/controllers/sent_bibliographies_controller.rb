class SentBibliographiesController < ApplicationController
  before_action :set_sent_bibliography, only: [:show, :edit, :update, :destroy]

  # GET /sent_bibliographies
  # GET /sent_bibliographies.json
  def index
    @sent_bibliographies = SentBibliography.all
  end

  # GET /sent_bibliographies/1
  # GET /sent_bibliographies/1.json
  def show
  end

  # GET /sent_bibliographies/new
  def new
    @sent_bibliography = SentBibliography.new
  end

  # GET /sent_bibliographies/1/edit
  def edit
  end

  # POST /sent_bibliographies
  # POST /sent_bibliographies.json
  def create
    @sent_bibliography = SentBibliography.new(sent_bibliography_params)

    respond_to do |format|
      if @sent_bibliography.save
        format.html { redirect_to @sent_bibliography, notice: 'Sent bibliography was successfully created.' }
        format.json { render :show, status: :created, location: @sent_bibliography }
      else
        format.html { render :new }
        format.json { render json: @sent_bibliography.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sent_bibliographies/1
  # PATCH/PUT /sent_bibliographies/1.json
  def update
    respond_to do |format|
      if @sent_bibliography.update(sent_bibliography_params)
        format.html { redirect_to @sent_bibliography, notice: 'Sent bibliography was successfully updated.' }
        format.json { render :show, status: :ok, location: @sent_bibliography }
      else
        format.html { render :edit }
        format.json { render json: @sent_bibliography.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sent_bibliographies/1
  # DELETE /sent_bibliographies/1.json
  def destroy
    @sent_bibliography.destroy
    respond_to do |format|
      format.html { redirect_to sent_bibliographies_url, notice: 'Sent bibliography was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sent_bibliography
      @sent_bibliography = SentBibliography.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sent_bibliography_params
      params.require(:sent_bibliography).permit(:archive_id, :archive_number, :destination_id, :date)
    end
end
