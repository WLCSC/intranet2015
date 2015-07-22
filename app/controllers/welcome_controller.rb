class WelcomeController < ApplicationController
  def index
    @notes = Note.all
    @references = Reference.all
    if browser_is?('ie')
      @browsinger = true
    else
      @browsinger = false
    end
  end
end
