class BibliographyStylesController < ApplicationController
  before_action :set_bibliography_style, only: [:show, :edit, :update, :destroy]

  # GET /bibliography_styles
  # GET /bibliography_styles.json
  def index
    @bibliography_styles = BibliographyStyle.all
  end

  # GET /bibliography_styles/1
  # GET /bibliography_styles/1.json
  def show
  end

  # GET /bibliography_styles/new
  def new
    @bibliography_style = BibliographyStyle.new
  end

  # GET /bibliography_styles/1/edit
  def edit
  end

  # POST /bibliography_styles
  # POST /bibliography_styles.json
  def create
    @bibliography_style = BibliographyStyle.new(bibliography_style_params)

    respond_to do |format|
      if @bibliography_style.save
        format.html { redirect_to @bibliography_style, notice: 'Bibliography style was successfully created.' }
        format.json { render :show, status: :created, location: @bibliography_style }
      else
        format.html { render :new }
        format.json { render json: @bibliography_style.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bibliography_styles/1
  # PATCH/PUT /bibliography_styles/1.json
  def update
    respond_to do |format|
      if @bibliography_style.update(bibliography_style_params)
        format.html { redirect_to @bibliography_style, notice: 'Bibliography style was successfully updated.' }
        format.json { render :show, status: :ok, location: @bibliography_style }
      else
        format.html { render :edit }
        format.json { render json: @bibliography_style.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bibliography_styles/1
  # DELETE /bibliography_styles/1.json
  def destroy
    @bibliography_style.destroy
    respond_to do |format|
      format.html { redirect_to bibliography_styles_url, notice: 'Bibliography style was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bibliography_style
      @bibliography_style = BibliographyStyle.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def bibliography_style_params
      params.require(:bibliography_style).permit(:standard, :document_type_id, :field_id, :sequence, :format)
    end
end
