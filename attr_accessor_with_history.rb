class Class
  def attr_accessor_with_history(attr_name)
    attr_name = attr_name.to_s # make sure it's a string
    attr_reader attr_name # create the attribute's getter
    attr_reader attr_name+"_history" # create bar_history getter
    class_eval %Q{
      # YOUR CODE HERE
	  @#{attr_name} = nil unless defined? @#{attr_name}
def #{attr_name}=(obj)
    if #{attr_name} == nil then
      @#{attr_name}_history = Array.new()
    end
    @#{attr_name}_history<< @#{attr_name}
    @#{attr_name} = obj
  end
def #{attr_name}
    @#{attr_name}
    end
   }
  end
end

