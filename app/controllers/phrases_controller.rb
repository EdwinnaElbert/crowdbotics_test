class PhrasesController < ApplicationController

  def index
    session[:phrases] = shuffled_phrases_ids
  end

  def display_phrase
    respond_to do |format|
      if !session[:phrases].empty?
        # removes used id from session[:phrases] and returns Phrase with that id
        @phrase = Phrase.find(session[:phrases].pop)
        @phrases_left = session[:phrases].count
        format.js {}
      else
        format.js { render js: 'alert("no phrases left");' }
      end
    end
  end

  private

  def shuffled_phrases_ids
    # returns an array of random ids from Phrase
    Phrase.pluck(:id).shuffle
  end

end
