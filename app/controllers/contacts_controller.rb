class ContactsController < ApplicationController
  def new
    @contact = Contact.new
    @company = Company.find(params[:company_id])
  end

  def create
    contact = Contact.new(contact_params)
    contact.company_id = params[:company_id]
    contact.save

    redirect_to company_jobs_path(contact.company)
  end

  def show
    @contact = Contact.find(params[:id])
  end

  def edit
    @contact = Contact.find(params[:id])
    @company = @contact.company
  end

  def update
    @contact = Contact.find(params[:id])
    @contact.update(contact_params)

    redirect_to contact_path(@contact)
  end

  def destroy
    contact = Contact.find(params[:id])
    company = contact.company
    contact.destroy

    redirect_to company_jobs_path(company)
  end
  private

  def contact_params
    params.require(:contact).permit(:name, :position, :email)
  end
end
