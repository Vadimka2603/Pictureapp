module Users
  class Register < ActiveInteraction::Base
    
    string :password
    string  :name

    

    def execute
      user = User.create(inputs)
    end

  end
end