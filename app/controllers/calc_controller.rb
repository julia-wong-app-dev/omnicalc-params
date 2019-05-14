class CalcController < ApplicationController
    def flex_square
        
        # Rails, behind the scenes, creates a variable called 'params' and assigns:
        #  Parameters: {"zebra"=>"42"}
        # Now, we get to use it
        
        @a_number = params.fetch("zebra").to_i
        @squared_number = @a_number**2
        
        render("flex_templates/square.html.erb")
        
    end
end