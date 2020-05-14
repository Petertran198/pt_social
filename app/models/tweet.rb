class Tweet < ApplicationRecord
    belongs_to :user
    validates :message, presence: true
    validates :message, length: {maximum: 140, too_long: "A tweet can only be 140 characters max..." }, on: :create 
    has_many :tweet_tags
    has_many :tags, through: :tweet_tags
    before_validation :link_check, on: [:create]
    after_validation :apply_link, on: [:create]
    def link_check
        # We will need a variable that starts off at false that only turns true when there is a link
        check = false 

        if self.message.include?("http://") || self.message.include?("https://")
            check = true  
        end
        #If it is true a link is there 
        if check == true 
            #We are going to split it into an array of words 
            arr = self.message.split()
            #.index will return the first index position of a link
            index =  arr.map{ |word| word.include?("http")}.index(true)
            #We will then save the lik because we are going to shortened it and will will need it to actually make a <a href> tag
            # arr[index] == the link
            self.link = arr[index]
            if arr[index].length > 23 
                #If the link is greater than 23 characters then we will shortenen it 
                arr[index] = "#{arr[index][0..22]}.."
            end

            #After we are done shortening the link we have to join the arr back and assign it into self.message
            self.message = arr.join(" ")
        end
    end


    def apply_link 
        arr = self.message.split()
        index = arr.map{ |word| word.include?("http") }.index(true)
        #If an index was found that means a link found because index will hold the index position of the http. If it can't find an instance of true(aka link) it will return null 
        if index
            #Right now arr[index] holds the shortened url or just a url if it is under 23 sharacters long
            shortened_url = arr[index]
            arr[index] = "<a a href='#{self.link}' target='_blank'>#{shortened_url}</a>"
        end
        self.message = arr.join(" ")
    end


end
