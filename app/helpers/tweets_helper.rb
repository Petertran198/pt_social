module TweetsHelper


    def get_tagged(tweet)
      
        #Splitting the tweet into indivual words 
        message_arr = tweet.message.split 
        #we have parse through the tweet going from word to word to check if it has a hashtag 
        message_arr.each_with_index do |word, index| 
            #If the the first letter of a word is a hash it must be a HASHTAG 
            if word[0] == "#"
                if Tag.pluck(:phrase).include?(word)
                    tag = Tag.find_by(phrase: word.downcase)
                else 
                    tag = Tag.create(phrase: word.downcase)
                end
                #After we made a new instance of tag or find it in our database we can use both tag and tweet to set up the association or connect them by passing it into TweetTag 
                tweet_tag = TweetTag.create(tweet_id: tweet.id, tag_id: tag.id)
                message_arr[index]  = "<a href='/tag_tweets?tag_id=#{tag.id}'>#{word}</a>"
            end
        end
        #After we iterate through the whole tweet and found all the #hashtag we got to join the message back to the actual tweet message 
        tweet.message = message_arr.join(" ")
        return tweet 
    end



    
end
