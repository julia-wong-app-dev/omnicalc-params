class CalcController < ApplicationController
    def flex_square
        
        # Rails, behind the scenes, creates a variable called 'params' and assigns:
        #  Parameters: {"zebra"=>"42"}
        # Now, we get to use it
        
        @a_number = params.fetch("zebra").to_i
        @squared_number = @a_number**2
        
        render("flex_templates/square.html.erb")
        
    end
    
    def flex_square_root
        @b_number = params.fetch("kangaroo").to_f
        @square_root = @b_number**0.5
        
        render("flex_templates/square_root.html.erb")
    end
    
    def flex_payment
        @rate = params.fetch("basis_points").to_f
        @r = helpers.number_to_percentage(@rate/100, precision:2)
        @years = params.fetch("number_of_years").to_i
        @present_value = params.fetch("present_value").to_i
        @pv = helpers.number_to_currency(@present_value, precision:0)
        @payment = (@rate/12/10000 * @present_value)/(1-((1+@rate/12/10000)**(-(@years*12))))
        @pmt = helpers.number_to_currency(@payment, precision:2)
        
        render("flex_templates/payment.html.erb")
    end
    
    def random
        @low_end = params.fetch("low_end").to_i
        @high_end = params.fetch("high_end").to_i
        @random_number = Random.rand(@low_end...@high_end)
        
        render("flex_templates/random.html.erb")
    end
end