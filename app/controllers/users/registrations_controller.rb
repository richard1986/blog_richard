class Users::RegistrationsController < Devise::RegistrationsController
  
  #layout "backend", only: [ :edit ]
  after_action :create_account, only: :create

  private

  def create_account
    #raise @user.account.to_yaml
    @user.create_account( :fullname => "My Fullname",
             :address => "My Address",
             :phone => "1111111111")
  end
end