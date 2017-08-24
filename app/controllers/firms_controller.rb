class FirmsController < ApplicationController
  def index
    @q = Firm.ransack(params[:q])
    @firms = @q.result(:distinct => true).includes(:visits).page(params[:page]).per(25)
    @location_hash = Gmaps4rails.build_markers(@firms.where.not(:mappable_address_latitude => nil)) do |firm, marker|
      marker.lat firm.mappable_address_latitude
      marker.lng firm.mappable_address_longitude
      marker.infowindow "<h5><a href='/firms/#{firm.id}'>#{firm.name}</a></h5><small>#{firm.mappable_address_formatted_address}</small>"
     end
       
    if params[:location].present?
      @firmssearch = Firm.near(params[:location], params[:distance] || 10, order: :distance)
    else
      @firmssearch = Firm.all
    end

    render("firms/index.html.erb")
  end

  def show
    @bookmark = Bookmark.new
    @firm = Firm.find(params[:id])

    render("firms/show.html.erb")
  end

  def new
    @firm = Firm.new

    render("firms/new.html.erb")
  end

  def create
    @firm = Firm.new

    @firm.name = params[:name]
    @firm.mappable_address = params[:mappable_address]
    @firm.address = params[:address]
    @firm.category = params[:category]
    @firm.city = params[:city]
    @firm.state = params[:state]

    save_status = @firm.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/firms/new", "/create_firm"
        redirect_to("/firms")
      else
        redirect_back(:fallback_location => "/", :notice => "Firm created successfully.")
      end
    else
      render("firms/new.html.erb")
    end
  end

  def edit
    @firm = Firm.find(params[:id])

    render("firms/edit.html.erb")
  end

  def update
    @firm = Firm.find(params[:id])

    @firm.name = params[:name]
    @firm.mappable_address = params[:mappable_address]
    @firm.address = params[:address]
    @firm.category = params[:category]
    @firm.city = params[:city]
    @firm.state = params[:state]

    save_status = @firm.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/firms/#{@firm.id}/edit", "/update_firm"
        redirect_to("/firms/#{@firm.id}", :notice => "Firm updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Firm updated successfully.")
      end
    else
      render("firms/edit.html.erb")
    end
  end

  def destroy
    @firm = Firm.find(params[:id])

    @firm.destroy

    if URI(request.referer).path == "/firms/#{@firm.id}"
      redirect_to("/", :notice => "Firm deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Firm deleted.")
    end
  end
end
