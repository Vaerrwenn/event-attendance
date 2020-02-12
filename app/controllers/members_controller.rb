class MembersController < ApplicationController
    def index
      @members = Member.all

      @search = params["search"]
      if @search.present?
        @name = @search["name"]
        @members = Member.where("name LIKE ?", "%#{@name}%")
        if @members.blank?
          @member_return = "empty"
        # elsif @name.present? == 'true'
        # else
        #   @members
        end
      end
    end

    def show
      @member = Member.find(params[:id])
    end

    def new
      @member = Member.new
    end

    def create
      @member = Member.new(member_params)

      if @member.save
        redirect_to @member
      else
        render 'new' ##use render to pass the values back
      end
    end

    def edit
      @member = Member.find(params[:id])
    end

    def update
      @member = Member.find(params[:id])

      if @member.update(member_params)
        redirect_to @member
      else
        render 'edit'
      end
    end
    
    def destroy
      @member = Member.find(params[:id])
      @member.destroy

      redirect_to members_path
    end

    private
    def member_params
      params.require(:member).permit(:name, :gender, :dob, :status, :occupation, :phone, :email, :instagram, :line, :address)
    end
end
