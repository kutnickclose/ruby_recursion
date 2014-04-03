class WordChains

  def explore_words(source, dictionary)
    @words_to_expand = [source]
    @candidate_words = dictionary.select { |word| word.length == source.length}
    @all_reachable_words = [source]

    until @words_to_expand.empty?
       adj_words = adjacent_words(@words_to_expand.pop, @candidate_words)
       adj_words.each do |word|
         unless @words_to_expand.include?(word)
           @words_to_expand << word
           @all_reachable_words << word
           @candidate_words.delete(word)
         end
       end
     end

     @all_reachable_words
  end

  def adjacent_words(word, dictionary)
    one_letter_off = []
    dictionary.each do |wr|
      not_matching_letters = 0
      wr.split('').each_index do |ind|
        if wr[ind] != word[ind]
          not_matching_letters += 1
        end
      end
      if not_matching_letters == 1
        one_letter_off << wr
      end
    end
    one_letter_off
  end

  def find_chain(source, target, dictionary)
    @words_to_expand = [source]
    @candidate_words = dictionary.select { |word| word.length == source.length}
    @parents = Hash.new

    until @words_to_expand.last == target
       adj_words = adjacent_words(last_word = @words_to_expand.shift, @candidate_words)
       adj_words.each do |word|
         unless @words_to_expand.include?(word)
           @words_to_expand << word
           @parents[word] = last_word
           @candidate_words.delete(word)
         end
       end
     end

     build_path_from_breadcrumbs(source,target)
  end

  def build_path_from_breadcrumbs(source, target)
    path_arr = [target]
    until path_arr.include?(source)
      path_arr << @parents[path_arr.last]
    end
    path_arr
  end
end


dictionary = File.readlines('dictionary.txt').map(&:chomp)

word_chain = WordChains.new
p word_chain.find_chain('shah', 'thaw', dictionary)
