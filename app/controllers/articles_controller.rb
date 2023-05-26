class ArticlesController < ApplicationController

    def show
      #debugger
      @article =  Article.find(params[:id])
    end

    def index
      @articles = Article.all
    end

    def new
      @article = Article.new
    end

    def create
      @article = Article.new(params.require(:article).permit(:title, :description))
      if @article.save
        flash[:notice] = "Article created successfully!"
        redirect_to @article#_path(@article)
        #render plain: @article.inspect
      else
        render 'new'
      end
    end

end