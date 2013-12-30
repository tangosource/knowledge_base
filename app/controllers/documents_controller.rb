class DocumentsController < ApplicationController
  def new
    @document = Document.new
  end

  def show
  end

  def create
    if @document.save
      redirect_to @document
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @document.update_attributes(doc_params)
      redirect_to(@document)
    else
      render :edit
    end
  end

  def destroy
    if @document.destroy
      redirect_to root_path
    else
      redirect_to root_path
      flash.now[:alert] = 'Error while deleting document!'
    end
  end

  private

  def doc_params
    params.require(:document).permit(:title, :body, :tag_list)
  end

end
