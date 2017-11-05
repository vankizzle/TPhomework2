class NotesController < ApplicationController
  protect_from_forgery with: :null_session
  before_action :set_note, only: [:show, :edit, :update, :destroy]

  # GET /notes
  # GET /notes.json
  def index
    @notes = Note.all
  end

  # GET /notes/1
  # GET /notes/1.json
  def show
  end

  # GET /notes/new
  def new
    @note = Note.new
  end

  # GET /notes/1/edit
  def edit
  end

  # POST /notes
  # POST /notes.json
  def create
    if request.content_type =~ /xml/ 
           params[:message] = Hash.from_xml(request.body.read)["message"] 
             note = Note.create(note_params_api) 
             render xml: 
             '<?xml version = "1.0" encoding = "UTF-8" standalone ="yes"?>' + 
             '<url>' + 
                 notes_url + note.id.to_s +  
             '</url>'; 
         elsif request.content_type =~ /json/ 
             note = Note.create(note_params_api) 
             render json: {url: notes_url + note.id.to_s } 
         elsif request.content_type =~ /form/ 
             @note = Note.new(note_params) 

             @note.author = current_user 
             if @note.save 
                 redirect_to notes_url + @note.id.to_s + '/info' 
             else 
                 @errors = @note.errors 
                 render 'new' 
             end 
         end 

  end

def info
	render "adress",locals:{url:notes_url + "/" + params[:id]}
end

  # PATCH/PUT /notes/1
  # PATCH/PUT /notes/1.json
  def update
    respond_to do |format|
      if @note.update(note_params)
        format.html { redirect_to @note, notice: 'Note was successfully updated.' }
        format.json { render :show, status: :ok, location: @note }
      else
        format.html { render :edit }
        format.json { render json: @note.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /notes/1
  # DELETE /notes/1.json
  def destroy
    @note.destroy
    respond_to do |format|
      format.html { redirect_to notes_url, notice: 'Note was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_note
      @note = Note.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def note_params
      params.require(:note).permit(:content)
    end
  
    def note_params_api 
      params.permit(:content, :message, :email, :password) 
    end 
 

end
