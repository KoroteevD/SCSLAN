# coding: utf-8

=begin
  Контроллер новостей
=end
class PostsController < ApplicationController

  #
  # Фильтр find_post(см. объявление метода):
  #   поиск указанного поста перед выполнением
  #   экшенов show, edit, update, delete
  #
	before_filter :find_post, :only=>[:show,:edit,:update,:destroy]
  before_filter :authenticate_user!, :only=>[:new,:create,:edit,:update,:destroy]


  #
  # Индексный экшен контроллера:
  #   передает представлению список новостей
  #
  def index
    @page = 0    
    @page = params[:page].to_i-1 if params[:page]
  	@posts = Post.where('1=1').order("id desc").limit(5).offset(@page*5)
    @count = Post.all.count
    @pages = (@count / 5.0).ceil
    puts @pages
  end

  # Экшен для просмотра соответствующего post
  def show 
    # call self.find_post
  end

  #
  # создает пустой объект поста, рендерит форму создания
  #
  def new
    # пустой пост нужен, чтобы create отрендерил форму с создаваемым
    # в нем объектом, т.е. если будут ошибки валидаций, их можно будет показать
  	@post = Post.new
  end

  #
  # Экшен создания поста
  #
  def create
  	@post = Post.create(post_params)
    unless @post.valid?
  	 render 'new' 
     return
   end
   post_photos(params[:photos])
   redirect_to	action: :show, id: @post
  end

  def edit
  end

  def update
    @post.update_attributes(post_params)
    unless @post.valid?
      render 'edit' 
      return
    end
    post_photos(params[:photos])
    redirect_to action: :show, id: @post
  end

  def destroy
    @post.destroy
    redirect_to action: :index
  end

  def find_post
  	@post = Post.where(id: params[:id]).first
  	render_404 until @post
  end

  def post_photos(photos)
    if photos
      photos.each do |photo|
        att = Attachment.new
        att.photo = photo
        att.post_id = @post.id
        att.save
      end
    end
  end

  private
    # Метод в стиле RoR4, убирающий из параметров запроса 
    # все поля, которые не указаны в аргументах permit
    def post_params
      params.require(:post).permit(:title, :text, :photo)
    end

end