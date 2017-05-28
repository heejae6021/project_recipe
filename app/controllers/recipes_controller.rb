class RecipesController < ApplicationController
  
  require 'open-uri'
  require 'uri' 
  require 'net/http'
  
  def index
    @recipes = Recipe.all
    @Items = Item.all
    
    page2 = Nokogiri::HTML(open("http://haemukja.com/recipes/1253"))
    @img_link_temp = page2.css('ul.slides img')

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
        
        if (p_num/s_num.to_f) > 0.4
            @selected_pick << [r,(p_num/s_num.to_f)] 
        end 
    end
        
  end


  def practice
   @selected_pick = [] 
    # @recipes = Recipe.all
    @recipes = [["meat pie",["a","1","c","d","e","f"],"link"],["second_recipe",["a","b","3","4","5","6"],"link"]]
      #user_select = Ingredient.last.s_ingred
      user_select = ["a","b","qqq","wwww"]
      
    @recipes.each do |r|
      s_num = user_select.length
      user_select.each do |item|
        if r[1].include?(item)
          s_num -= 1
        end
      end
        
      if s_num < 3
          @selected_pick << r 
      end 
    end
  end
  
end
  