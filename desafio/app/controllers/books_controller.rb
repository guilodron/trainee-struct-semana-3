class BooksController < ApplicationController
  def index
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
  end 

  def new
    @book = Book.new
    @writers = Writer.all
  end

  def create
    @book = Book.new(book_params)

    begin
      @book.save!
      flash[:notice] = 'sucesso'
    rescue => exception
      flash[:notice] = 'falha'  
    ensure
      redirect_to books_path()
    end
  end

  def edit
    @book = Book.find(params[:id])
    @writers = Writer.all
  end

  def update
    @book = Book.find(params[:id])
    begin
      @book.update!(book_params)
      flash[:notice] = 'sucesso'        
    rescue => exception
      flash[:notice] = 'falha'        
    ensure
      redirect_to books_path()      
    end
  end

  def destroy
    @book = Book.find(params[:id])

    begin
      @book.destroy!
      flash[:notice] = 'livro deletado com sucesso'
    rescue => exception
      flash[:notice] = 'falha'
    ensure
      redirect_to books_path()
    end
  end


  private
    def book_params
      params.require(:book).permit(:name, :year, :writer_id)
    end
end
