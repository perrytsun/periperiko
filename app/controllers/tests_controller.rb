class TestsController < ApplicationController

    before_action :authenticate_user!, only: [:new, :create]
    
    def index
      if params[:search] == nil
          @tests= Test.all.page(params[:page]).per(3)
      elsif params[:search] == ''
          @tests= Test.all.page(params[:page]).per(3)
      else
          @tests = Test.where("body LIKE ? ",'%' + params[:search] + '%').page(params[:page]).per(3)
      end
  end

    def new
        @test = Test.new
    end

    def create
        test = Test.new(test_params)
        test.user_id = current_user.id
        if test.save
          redirect_to :action => "index"
        else
          redirect_to :action => "new"
        end
      end

    def edit
        @test = Test.find(params[:id])
    end

    def show
        @test = Test.find(params[:id])
        @comments = @test.comments
        @comment = Comment.new
    end

    def update
        test = Test.find(params[:id])
        if test.update(test_params)
          redirect_to :action => "show", :id => test.id
        else
          redirect_to :action => "new"
        end
      end

      def destroy
        test = Test.find(params[:id])
        test.destroy
        redirect_to action: :index
      end

     
    private
    def test_params
        params.require(:test).permit(:user_name, :post_name, :body, :image)
    end

end
