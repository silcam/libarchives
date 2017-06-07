class ArchivesController < ApplicationController
  before_action :set_archive, only: [:show, :edit, :update, :destroy]
  skip_before_action :require_login, only: [:show, :index, :home]

  def home

  end
  # GET /archives
  # GET /archives.json
  def index
    if params[:q]
      @last_query = params[:q]
      @archives = Archive.search params[:q]
    elsif params[:language]
      @archives = Language.find(params[:language]).archives
    elsif params[:author]
      @archives = Author.find(params[:author]).archives
    else
      @archives = Archive.all
    end
  end

  # GET /archives/1
  # GET /archives/1.json
  def show
  end

  # GET /archives/new
  def new
    @archive = Archive.new
  end

  # GET /archives/1/edit
  def edit
  end

  # POST /archives
  # POST /archives.json
  def create
    @archive = Archive.new(archive_params)

    respond_to do |format|
      if @archive.save
        @archive.after_save params[:authors], params[:archive][:file]
        format.html { redirect_to @archive, notice: 'Archive was successfully created.' }
        format.json { render :show, status: :created, location: @archive }
      else
        format.html { render :new }
        format.json { render json: @archive.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /archives/1
  # PATCH/PUT /archives/1.json
  def update
    respond_to do |format|
      if @archive.update(archive_params)
        @archive.after_save params[:authors], params[:archive][:file]
        format.html { redirect_to @archive, notice: 'Archive was successfully updated.' }
        format.json { render :show, status: :ok, location: @archive }
      else
        format.html { render :edit }
        format.json { render json: @archive.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /archives/1
  # DELETE /archives/1.json
  def destroy
    @archive.destroy
    respond_to do |format|
      format.html { redirect_to archives_url, notice: 'Archive was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_archive
      @archive = Archive.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def archive_params
      params.require(:archive).permit(:number, :document_type_id, :backup_number, :capacity, :year, :title, :english_title, :french_title, :title_of_book_reviewed, :author_book_reviewed, :journal_name, :journal_vol, :journal_num, :title_of_book_containing_article, :details_of_referenced_book, :series_editor, :series_name, :series_number, :place_of_publication, :publisher, :thesis_type, :university, :conference_info, :pages, :edition, :copies_printed, :illustrations, :summary, :language_id, :bilingual_notes, :microfiche_info, :notes, :web_address)
    end
end
