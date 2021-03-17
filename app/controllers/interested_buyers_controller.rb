class InterestedBuyersController < ApplicationController
  def index
    matching_interested_buyers = InterestedBuyer.all

    @list_of_interested_buyers = matching_interested_buyers.order({ :created_at => :desc })

    render({ :template => "interested_buyers/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_interested_buyers = InterestedBuyer.where({ :id => the_id })

    @the_interested_buyer = matching_interested_buyers.at(0)

    render({ :template => "interested_buyers/show.html.erb" })
  end

  def create
    the_interested_buyer = InterestedBuyer.new
    the_interested_buyer.apt_id = params.fetch("query_apt_id")
    the_interested_buyer.email = params.fetch("query_email")
    the_interested_buyer.name = params.fetch("query_name")
    the_interested_buyer.phone_number = params.fetch("query_phone_number")

    if the_interested_buyer.valid?
      the_interested_buyer.save
      redirect_to("/interested_buyers", { :notice => "Interested buyer created successfully." })
    else
      redirect_to("/interested_buyers", { :notice => "Interested buyer failed to create successfully." })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_interested_buyer = InterestedBuyer.where({ :id => the_id }).at(0)

    the_interested_buyer.apt_id = params.fetch("query_apt_id")
    the_interested_buyer.email = params.fetch("query_email")
    the_interested_buyer.name = params.fetch("query_name")
    the_interested_buyer.phone_number = params.fetch("query_phone_number")

    if the_interested_buyer.valid?
      the_interested_buyer.save
      redirect_to("/interested_buyers/#{the_interested_buyer.id}", { :notice => "Interested buyer updated successfully."} )
    else
      redirect_to("/interested_buyers/#{the_interested_buyer.id}", { :alert => "Interested buyer failed to update successfully." })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_interested_buyer = InterestedBuyer.where({ :id => the_id }).at(0)

    the_interested_buyer.destroy

    redirect_to("/interested_buyers", { :notice => "Interested buyer deleted successfully."} )
  end
end
