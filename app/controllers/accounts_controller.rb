class AccountsController < ApplicationController
  include SmartListing::Helper::ControllerExtensions
  helper  SmartListing::Helper
  
  layout 'seeimages', :only => [:image]
  layout "backend", only:  [ :index, :show, :edit, :create, :update, :destroy ]
  before_action :set_account, only: [:show, :edit, :update, :destroy]

  # GET /accounts
  # GET /accounts.json
  def index
    accounts_scope = Account.all
    case search_params[:type]
    when "Fullname"
      accounts_scope = Account.search_by_fullname(search_params) if (search_params[:type] && search_params[:textsearch])
    when "Phone"
      accounts_scope = Account.search_by_phone(search_params) if (search_params[:type] && search_params[:textsearch])
    when "User"
      accounts_scope = Account.search_by_acc_user(search_params) if (search_params[:type] && search_params[:textsearch])
    end

    @accounts = smart_listing_create :accounts, accounts_scope, partial: "accounts/list",
                                          default_sort: {fullname: "asc"}
  end

  # GET /accounts/1
  # GET /accounts/1.json
  def show
  end

  # GET /accounts/new
  def new
    @account = Account.new
  end

  # GET /accounts/1/edit
  def edit
  end

  # POST /accounts
  # POST /accounts.json
  def create
    @account = Account.new(account_params)

    respond_to do |format|
      if @account.save
        format.html { redirect_to @account, notice: 'Account was successfully created.' }
        format.json { render :show, status: :created, location: @account }
      else
        format.html { render :new }
        format.json { render json: @account.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /accounts/1
  # PATCH/PUT /accounts/1.json
  def update
    respond_to do |format|
      if @account.update(account_params)
        format.html { redirect_to @account, notice: 'Account was successfully updated.' }
        format.json { render :show, status: :ok, location: @account }
      else
        format.html { render :edit }
        format.json { render json: @account.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /accounts/1
  # DELETE /accounts/1.json
  def destroy
    @account.destroy
    respond_to do |format|
      format.html { redirect_to accounts_url, notice: 'Account was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  # def addt
  #   require "rmagick"
  #   include Magick

  #   image = Magick::Image.read("public/historia.png").first
  #   # source = source.resize_to_fill(70, 70).quantize(256, Magick::GRAYColorspace).contrast(true)
  #   # overlay = Magick::Image.read("stamp_overlay.png").first
  #   # source.composite!(overlay, 0, 0, Magick::OverCompositeOp)
  #   # colored = Magick::Image.new(70, 70) { self.background_color = "red" }
  #   # colored.composite!(source.negate, 0, 0, Magick::CopyOpacityCompositeOp)
  #   # colored.write("stamp.png")
    
  #   #img = Magick::Image.read('public/historia.png')

  #   # img = ImageList.new(‘Your image path eg.public/historia.jpg’)
  #   # txt = Draw.new
  #   # img.annotate(txt, 0,0,0,0, “Hello”){
  #   # txt.gravity = Magick::SouthGravity
  #   # txt.pointsize = 25
  #   # txt.stroke = ‘#000000′
  #   # txt.fill = ‘#ffffff’
  #   # txt.font_weight = Magick::BoldWeight
  #   # }

  #   # img.format = ‘jpeg’
  #   # send_data img.to_blob, :stream => ‘false’, :filename => ‘test.jpg’, :type => ‘image/jpeg’,      :disposition => ‘inline’

  # end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_account
      @account = Account.by_id(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def account_params
      params.require(:account).permit(:fullname, :address, :phone, :user_id, :image)
    end

    def search_params
      params.permit(:type, :textsearch)
    end
end
