class DocsController < ApplicationController
    before_action :find_doc, only: [:show, :edit, :update, :destroy]


    def index
        @docs = Doc.where(user_id: current_user)     #Doc.all.order("created_at DESC") izbrisano nakon User modula. Svaki User moze vidjeti samo svoje docs.
    end
  
    def show
    end
    
    def new
        @doc = current_user.docs.build        # @doc = Doc.new -ovo smo promjenili kada smo dodali User model!
    end
    
    def create
        @doc = current_user.docs.build(doc_params)   #@doc = Doc.new(doc_params) isto tako i ovde smo promjenili
        if @doc.save
            redirect_to @doc
        else
            render_to 'new'
        end
    end
    
    def edit
    end
    
    def update
        if @doc.update(doc_params)
            redirect_to @doc
        else
            render 'edit'
        end
    end
    
    def destroy
        @doc.destroy
        redirect_to docs_path
    end
    
    private
    
      def find_doc
          @doc = Doc.find(params[:id])
      end
      
      def doc_params
          params.require(:doc).permit(:title, :content)
      end
  


end
