class WritersController < ApplicationController

  def index
    @writers = Writer.all
  end

  def show
    @writer = Writer.find(params[:id])
  end 

  def new
    @writer = Writer.new
  end

  def create
    @writer = Writer.new(writer_params)

    begin
      @writer.save!
      flash[:notice] = 'sucesso'
    rescue => exception
      flash[:notice] = 'falha'  
    ensure
      redirect_to writers_path()
    end
  end

  def edit
    @writer = Writer.find(params[:id])
  end

  def update
    @writer = Writer.find(params[:id])
    begin
      @writer.update!(writer_params)
      flash[:notice] = 'sucesso'        
    rescue => exception
      flash[:notice] = 'falha'        
    ensure
      redirect_to writers_path()      
    end
  end

  def destroy
    @writer = Writer.find(params[:id])

    begin
      @writer.destroy!
      flash[:notice] = 'autor deletado com sucesso'
    rescue => exception
      flash[:notice] = 'falha'
    ensure
      redirect_to writers_path()
    end
  end


  private
    def writer_params
      params.require(:writer).permit(:name, :birth_year, :country)
    end
end
