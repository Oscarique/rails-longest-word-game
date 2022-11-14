class GamesController < ApplicationController
  def new
    @letters = ('A'..'Z').to_a.sample(10)
  end

  def score
    @word = params[:word]
    @letters = params[:letters].split(',')
    @letters.each do |letter|
      if @word.chars.include?(@letter)
        return "you've made it!"
      end
    end
  end
end
