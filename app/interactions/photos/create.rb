module Photos
  class Create < ActiveInteraction::Base
    
    string :description
    model  :user
    file   :picture

    validates :description, length: { maximum: 70 }
    validates :picture, presence: true

    def execute
      photo = Photo.create(inputs)
    end
  end
end