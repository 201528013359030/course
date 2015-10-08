# When done, submit this entire file.

# Part 1

def sum arr
  # YOUR CODE HERE
  if arr.empty?
    0
  else
    eval arr.join('+')
  end
end

def max_2_sum arr
  # YOUR CODE HERE
  if arr.empty?
    0
  elsif arr.length<2
    arr
  else
    eval arr.sort.reverse[0..1].join('+')
  end
end

def sum_to_n? arr, n
  # YOUR CODE HERE
  if arr.empty? #判断数组是否为空
    if n==0
      return true
    end
  else #若不为空
    for i in 0..(arr.length-1)
      if arr[i+1..arr.length-1].include? (n-arr[i])
        return true
      end
    end
    return false
  end
end

# Part 2

def hello(name)
  # YOUR CODE HERE
  return "Hello, #{name}"
end

def starts_with_consonant? s
  # YOUR CODE HERE
  if s.empty? #判断数组是否为空
    return false
  end
  if s[0]=~/[^bcdefghjklmnpqrstvwxyz]/i
    return false
  else
    return true
  end
end

def binary_multiple_of_4? s
  # YOUR CODE HERE
  if s.empty? ||s =~/\D/ #s =~/\D/  s是否匹配一个非数字字符
    return false
  end
  if (s[-1].to_i==0)
    if (s.length < 2|| s[-2].to_i==0)
      return s
    end
  else
    return false
  end
end

# Part 3

class BookInStock
# YOUR CODE HERE

  def initialize(isbn, price)
    if isbn==""
      raise ArgumentError #Raise Exception
    else
      @isbn=isbn #Init @isbn
    end
    if price<=0
      raise ArgumentError
    else
      @price=price
    end

  end


  def price_as_string
    @price="$"+format("%.2f", @price)
  end

  def isbn #The getter method for @isbn
    @isbn
  end

  def price
    @price
  end

  def isbn=(value) #The setter method for @isbn
    @isbn=(value)
  end

  def price=(value)
    @price=(value)
  end
end

