class ApartmentsController < ApplicationController
  skip_before_action(:force_user_sign_in, { :only => [:index, :show]})
  def index
    matching_apartments = Apartment.all

    @list_of_apartments = matching_apartments.order({ :created_at => :desc })

    render({ :template => "apartments/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_apartments = Apartment.where({ :id => the_id })

    @the_apartment = matching_apartments.at(0)

    render({ :template => "apartments/show.html.erb" })
  end

  def create
    the_apartment = Apartment.new
    the_apartment.price = params.fetch("query_price")
    the_apartment.location = params.fetch("query_location")
    the_apartment.num_bath = params.fetch("query_num_bath")
    the_apartment.num_bdrms = params.fetch("query_num_bdrms")
    the_apartment.furniture_amt = params.fetch("query_furniture_amt")
    the_apartment.status = params.fetch("query_status")
    the_apartment.description = params.fetch("query_description")
    the_apartment.user_id = params.fetch("query_user_id")
    the_apartment.photos_count = params.fetch("query_photos_count")
    the_apartment.interested_buyers_count = params.fetch("query_interested_buyers_count")

    if the_apartment.valid?
      the_apartment.save
      redirect_to("/apartments", { :notice => "Apartment created successfully." })
    else
      redirect_to("/apartments", { :notice => "Apartment failed to create successfully." })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_apartment = Apartment.where({ :id => the_id }).at(0)

    the_apartment.price = params.fetch("query_price")
    the_apartment.location = params.fetch("query_location")
    the_apartment.num_bath = params.fetch("query_num_bath")
    the_apartment.num_bdrms = params.fetch("query_num_bdrms")
    the_apartment.furniture_amt = params.fetch("query_furniture_amt")
    the_apartment.status = params.fetch("query_status")
    the_apartment.description = params.fetch("query_description")
    the_apartment.user_id = params.fetch("query_user_id")
    the_apartment.photos_count = params.fetch("query_photos_count")
    the_apartment.interested_buyers_count = params.fetch("query_interested_buyers_count")

    if the_apartment.valid?
      the_apartment.save
      redirect_to("/apartments/#{the_apartment.id}", { :notice => "Apartment updated successfully."} )
    else
      redirect_to("/apartments/#{the_apartment.id}", { :alert => "Apartment failed to update successfully." })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_apartment = Apartment.where({ :id => the_id }).at(0)

    the_apartment.destroy

    redirect_to("/apartments", { :notice => "Apartment deleted successfully."} )
  end
end
