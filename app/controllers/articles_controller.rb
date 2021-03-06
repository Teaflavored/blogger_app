class ArticlesController < ApplicationController
	def index
		@articles = Article.all
	end


	def show
		@article = Article.find(params[:id])
		@comment = Comment.new
		@comment.article_id = @article.id
	end

	def new
		@article = Article.new
	end

	def create
		@article = Article.new(article_params)
		if @article.save
			flash.notice = "Article #{@article.title} created!"
			redirect_to @article
		else
			render 'new'
		end
	end

	def destroy
		article = Article.find(params[:id])
		article.destroy!
		flash.notice = "Article #{article.title} destroy!"	
		redirect_to articles_path
	end

	def edit
		@article = Article.find(params[:id])
	end

	def update
		@article = Article.find(params[:id])
		if @article.update(article_params)
			flash.notice = "Article #{@article.title} updated!"
			redirect_to @article
		else
			render 'edit'
		end
	end


	private

	def article_params
		self.params.require(:article).permit(:title, :body, :tag_list)
	end
end
