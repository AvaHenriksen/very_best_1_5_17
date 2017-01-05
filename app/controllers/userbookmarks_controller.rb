class UserbookmarksController < ApplicationController
  def index
    @userbookmarks = Userbookmark.all

    render("userbookmarks/index.html.erb")
  end

  def show
    @userbookmark = Userbookmark.find(params[:id])

    render("userbookmarks/show.html.erb")
  end

  def new
    @userbookmark = Userbookmark.new

    render("userbookmarks/new.html.erb")
  end

  def create
    @userbookmark = Userbookmark.new

    @userbookmark.user_id = params[:user_id]
    @userbookmark.bookmark_id = params[:bookmark_id]

    save_status = @userbookmark.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/userbookmarks/new", "/create_userbookmark"
        redirect_to("/userbookmarks")
      else
        redirect_back(:fallback_location => "/", :notice => "Userbookmark created successfully.")
      end
    else
      render("userbookmarks/new.html.erb")
    end
  end

  def edit
    @userbookmark = Userbookmark.find(params[:id])

    render("userbookmarks/edit.html.erb")
  end

  def update
    @userbookmark = Userbookmark.find(params[:id])

    @userbookmark.user_id = params[:user_id]
    @userbookmark.bookmark_id = params[:bookmark_id]

    save_status = @userbookmark.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/userbookmarks/#{@userbookmark.id}/edit", "/update_userbookmark"
        redirect_to("/userbookmarks/#{@userbookmark.id}", :notice => "Userbookmark updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Userbookmark updated successfully.")
      end
    else
      render("userbookmarks/edit.html.erb")
    end
  end

  def destroy
    @userbookmark = Userbookmark.find(params[:id])

    @userbookmark.destroy

    if URI(request.referer).path == "/userbookmarks/#{@userbookmark.id}"
      redirect_to("/", :notice => "Userbookmark deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Userbookmark deleted.")
    end
  end
end