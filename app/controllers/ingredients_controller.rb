class IngredientsController < ApplicationController
  
  before_action :authorize, only: [ :new, :create, :edit, :update]
  #load_and_authorize_resource
  
  def index
    @items = Item.all 
    @ingredient = Ingredient.new 
  end  
  
  def show
    #@ingredients = Ingredient.all
    #@ingredient = Ingredient.find(params[:id])
    
    @selected_pick = [] 
    @recipes = Recipe.all
    # @recipes = [["meat pie",["a","b","c",d","e","f"],"link"],["second_recipe",["a","b","3","4","5","6"],"link"]]
      user_select = Ingredient.last.s_ingred.split(',')
      # user_select = ["a","b","qqq","wwww"]
     
    @recipes.each do |r|
      ingred_list = r.ingred.gsub(/\"/, '').sub(/\[/,'').sub(/\]/,'').gsub(/ /,'').split(',') 
      s_num = ingred_list.length
      p_num = 0
      user_select.each do |item|
        if ingred_list.include?(item)
          p_num += 1
        end
      end
        
        if (p_num/s_num.to_f) > 0.4 && (p_num/s_num.to_f) <= 1
            @selected_pick << [r,(p_num/s_num.to_f)] 
        end 
    end
        
  end

  
  def create
    # ingredients = Ingredient.new(ingredient_params)
    # ingredients.save
    # redirect_to ingredient_path(ingredients)
    
    
    
    @result = params[:ingredient][:s_ingred] # @result => array형식임
    
    # @ingredient = Ingredient.new
    # @ingredient.s_ingred = @result.join(',')
    Ingredient.create(s_ingred: @result.join(','), user_id: current_user.id)
    # @ingredient.user_id = current_user.id
    
    # @ingredient.save
    
    redirect_to '/ingredients/show'
    
  end

  def new
    @items = Item.all
    @ingredient = Ingredient.new
    
    @a = Ingredient.where(user_id: current_user.id)
    
    
    # authorize! :update, @ingredient

  end
  
  
  def update
    @ingredient = Ingredient.find(params[:id])
    @ingredient.update(post_params)
    redirect_to root_path
  end  
  

  
  
  
  private
  
  def authorize
  redirect_to new_session_path if current_user.nil? 
  end
  
  def ingredient_params
    params.require(:ingredient).permit(:user_id, :s_category, :s_ingred => [])
  end
  
end
