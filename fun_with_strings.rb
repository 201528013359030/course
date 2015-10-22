module FunWithStrings
  def palindrome?
    # your code here
    word =self.gsub(/\W/ , "")
    word.strip.downcase == word.strip.downcase.reverse and  word.is_a?(String) ? true : false    #strip: 去除空格
    end
  def count_words
    # your code here
    count=Hash.new(0)
    words = self.scan /\p{Letter}+'*\p{Letter}*/         #提取单词
    words.each{|word| count[word.downcase]+=1 unless word.empty?}
    return count.each{|key,value| "#{key}=>#{value}"}
  end

  def anagram_groups
    # your code here
    words=Hash.new(0)
    word1=self.split
    word1.each{|i| a=i.split(//).sort.join
                    if words.has_key? (a)
                      words[a]+=[i]
                    else
                      words[a]=[i]
                    end}
    return words.values
  end
end

# make all the above functions available as instance methods on Strings:

class String
  include FunWithStrings
end
