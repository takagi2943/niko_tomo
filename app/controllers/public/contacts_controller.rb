class Public::ContactsController < ApplicationController
   before_action :authenticate_user!, only: [:new, :create]

   def new
     @contact = Contact.new
   end

   def index
     @contacts = Contact.all
   end

   def create
     @contact = Contact.new(contact_params)
     if @contact.save
       redirect_to root_path, notice: 'お問い合わせ内容を送信しました'
    else
       render :new
    end
   end

   private

    def contact_params
      params.require(:contact).permit(:content)
    end

end
