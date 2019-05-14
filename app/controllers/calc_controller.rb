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
    
    def square_form
       render("form_templates/square.html.erb") 
    end
    
    def square_results
        @num = params.fetch("user_number").to_f
        @square_of_num = @num**2
        render("form_results/square.html.erb")
    end
    
    def square_root_form
        render("form_templates/square_root.html.erb")
    end
    
    def square_root_results
        @num = params.fetch("user_number").to_f
        @square_root_of_num = @num**0.5
        render("form_results/square_root.html.erb")
    end
    
    def payment_form
        render("form_templates/payment.html.erb")
    end
    
    def payment_results
        @apr = params.fetch("apr").to_f
        @r = helpers.number_to_percentage(@apr/100, precision:2)
        @years = params.fetch("years").to_i
        @principal = params.fetch("principal").to_i
        @pv = helpers.number_to_currency(@principal, precision:0)
        @payment = (@apr/12/1000*@principal)/(1-((1+@apr/12/10000)**(-(@years*12))))
        @payment_formatted = helpers.number_to_currency(@payment, precision:2)
        render("form_results/payment.html.erb")
    end
    
    def random_form
        render("form_results/random.html.erb")
    end
    
    def random_results
        @minimum = params.fetch("min").to_f
        @maximum = params.fetch("max").to_f
        @random = Random.rand(@minimum...@maximum).to_f
        
        render("form_results/random.html.erb")
    end
    
end