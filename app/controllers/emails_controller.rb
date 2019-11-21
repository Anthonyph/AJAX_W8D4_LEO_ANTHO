class EmailsController < ApplicationController
  
      def new
        @email = Email.new
      end
    
      def create
        @email = Email.new(object: Faker::Book.title, body: Faker::ChuckNorris.fact)
        if @email.save
          respond_to do |format|
            format.html { redirect_to root_path }
            format.js { }
          end
          
        
    
        else
          redirect_to root_path
          flash[:notice] = "Please try again"
        end
    
      end

      def show 
        @email = Email.find(params[:id])
                        
        respond_to do |format|          
          format.html {redirect_to emails_path}
          format.js { }

        end
        
      end
    
      def edit
        @email = Email.find(params[:id])
      end
    
      def update
        @email = Email.find(params[:id])
        @email.update_attribute(:read, true)
        respond_to do |format|          
          format.html {redirect_to emails_path}
          format.js { }

        end
      end
    
      def index
        @emails = Email.all

        
      end
    
      def destroy
        @email = Email.find(params[:id])
        @email.destroy
        respond_to do |format|
          format.html { redirect_to root_path }
          format.js { }
        end
      end
    
    
      private
    
      def task_params
        params.permit(:title, :deadline, :description)
      end
    
      def category_params
        params.require(:Category)
      end
    
  
end
