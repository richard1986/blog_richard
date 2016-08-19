class AccountsCreatorController < ApplicationController
 	#layout 'seeimages', :only => [ :avatar ]
 	layout "backend", :only => [  :new, :create ]
 	#before_action :authenticate_su_cs!
	def new
		@account = Account.new	
	end
	def create
		#raise user_params.to_yaml
		@user = User.create(user_params)
		
		@account = Account.new(
			 :fullname => account_params[:fullname],
			 :address => account_params[:address],
			 :phone => account_params[:phone],
			 :user_id => @user.id)
		 	respond_to do |format|
				if @user.save
					if @account.save
						format.html { redirect_to @account, :notice => {:class => "success", :body => "Account was successfully created."} }
						format.json { render :show, status: :created, location: @account }
					else
						User.last.destroy
						format.html { render :new }
						format.json { render json: @account.errors, status: :unprocessable_entity }	
					end
				else
					format.html { render :new }
					format.json { render json: @account.errors, status: :unprocessable_entity }	
				
				end
			end
	end
	private

	def account_params
	  @account_params ||= params.require(:account).permit(:fullname, :address,:phone, :user_id )
	end
	def user_params
	  params.require(:userc).permit(:email,:password,:password_confirmation)
	end
   

  
end
