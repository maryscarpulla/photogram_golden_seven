class PhotosController < ApplicationController

  def index
    @list_of_all_photos = Photo.all
    render("photos/index.html.erb")
  end

  def new_form
    render("photos/new.html.erb")
  end

  def create_row
    url = params[:da_source]
    cap = params[:da_caption]
    new_photo = Photo.new
    new_photo.source = url
    new_photo.caption = cap
    new_photo.save

    # render("photos/create_row.html.erb")

    redirect_to("/photos")
  end

  def show
    the_id = params[:da_id]
    @my_photo = Photo.find(the_id)

    render("photos/show.html.erb")
  end

  def edit_form
    the_id = params[:da_id]
    @my_photo = Photo.find(the_id) #when you find by the ID, it captures all fields for you so you can do stuff like @my_photo.caption
    # @url = @my_photo.source

    render("photos/edit_form.html.erb")
  end

  def update_row
    the_id = params[:da_id]
    update_photo = Photo.find(the_id)
    cap = params[:da_caption]
    url = params[:da_source]
    update_photo.source = url
    update_photo.caption = cap
    update_photo.save
    redirect_to("/photos/#{update_photo.id}")
  end


  def destroy_row

    the_id = params[:id]
    cap = params[:caption]
    url = params[:source]
    delete = Photo.find(the_id)
    delete.source = url
    delete.caption = cap
    delete.destroy

    redirect_to("/photos")

  end

end
