class ContactsController < ApplicationController
  def new
    @contact = Contact.new
    @company = Company.find(params[:company_id])
  end

  def create
    contact = Contact.new(contact_params)
    contact.company_id = params[:company_id]
    contact.save

    redirect_to contact_path(contact)
  end

  def show
    @contact = Contact.find(params[:id])
  end
  private

  def contact_params
    params.require(:contact).permit(:name, :position, :email)
  end
end
