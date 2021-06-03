class ProductsController < ApplicationController
  def index
    @products = Product.all.page(params[:page]).per(15)
  end

  def show
    @product = Product.find_by(id: params[:id])
  end
end

# <div class="container">
#       <nav aria-label="...">
#         <ul class="pagination justify-content-center">
#           <li class="page-item active">
#             <a class="page-link" href="#">1<span class="sr-only">(current)</span></a>
#           </li>
#           <li class="page-item"><a class="page-link" href="#">2</a></li>
#           <li class="page-item"><a class="page-link" href="#">3</a></li>
#         </ul>
#       </nav>
#     </div>
