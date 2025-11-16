class UploadedFilesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_uploaded_file, only: [:destroy]

  def index
    @uploaded_files = current_user.uploaded_files.order(uploaded_at: :desc)
  end

  def new
    @uploaded_file = UploadedFile.new
  end

  def create
    @uploaded_file = current_user.uploaded_files.build(uploaded_file_params)

    if @uploaded_file.save
      redirect_to uploaded_files_path, notice: 'ファイルが正常にアップロードされました。'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @uploaded_file.destroy
    redirect_to uploaded_files_path, notice: 'ファイルが削除されました。'
  end

  private

  def set_uploaded_file
    @uploaded_file = current_user.uploaded_files.find(params[:id])
  end

  def uploaded_file_params
    params.require(:uploaded_file).permit(:file)
  end
end
