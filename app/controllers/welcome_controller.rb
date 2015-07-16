class WelcomeController < ApplicationController
  def index
    @notes = Note.all
    @references = Reference.all
  end
end
