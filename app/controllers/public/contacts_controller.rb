class Public::ContactsController < ApplicationController
   before_action :authenticate_user!, only: [:new, :create]

   def new
     @contact = Contact.new
     @contacts_num = current_user.contacts.count
   end

   def index
     @contacts = current_user.contacts.all
   end

   def create
    @contact = current_user.contacts.new(contact_params)
    if @contact.save
      redirect_to root_path, notice: 'お問い合わせ内容を送信しました'
    else
      @contacts_num = current_user.contacts.count
      render :new
    end
   end

   private

    def contact_params
      params.require(:contact).permit(:content)
    end

end
