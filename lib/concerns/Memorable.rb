module Memorable
  module ClassMethods

    def create(name)
      new(name).tap(&:save)
    end

    def destroy_all
      all.clear
    end
  end
  module InstanceMethods
    def save
      
    end
  end
end
