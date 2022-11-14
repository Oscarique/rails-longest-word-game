require 'open-uri'
require 'json'

class GamesController < ApplicationController
  def new
    @letters = ('A'..'Z').to_a.sample(10)
  end

  def score
    @letters = params[:letters]
    @word = params[:word]
    # is word in the original grid?
    @letters_array = @letters.gsub(/\s+/, "").chars
    @response = URI.open("https://wagon-dictionary.herokuapp.com/#{@word}")
    @json = JSON.parse(@response.read)

    if @word.upcase.chars.all? { |letter| @word.count(letter) <= @letters_array.count(letter) }

  # is english word?

      if @json['found'] == true
        @answer = "Congratulations!#{@word} is a valid English word!"
      else
        @answer = "Sorry, but #{@word} does not seem to be a valid English word..."
      end
    else
      @answer = "Sorry, but #{@word} can't be built out of #{@letters}"
    end

  end
end
