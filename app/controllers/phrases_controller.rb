class PhrasesController < ApplicationController

  def index
    session[:phrases] = shuffled_phrases_ids
  end

  def display_phrase
    respond_to do |format|
      if !session[:phrases].empty?
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
    Phrase.pluck(:id).shuffle
  end

end
