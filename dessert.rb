class Dessert
  attr_accessor :name,:calories
  def initialize(name, calories)
    # your code here
    @name=name
    @calories=calories
  end
  def healthy?
    # your code here
    return true unless @calories>200
  end
  def delicious?
    # your code here
    return true
  end
end

class JellyBean < Dessert
  attr_accessor :name,:calories
  def initialize(flavor)
    # your code here
    @calories=5
    @name=flavor+" jelly bean"
  end
  def delicious?
    return  @name == "licorice jelly bean" ? false:true
  end
end
