class WelcomeController < ApplicationController
  def index
    @notes = Note.all
    @references = Reference.all
    if !request.env['HTTP_USER_AGENT'].downcase.match(/\).+\w+\/[0-9.]+/)
      @browsinger = true
    else
      @browsinger = false
    end
  end
end
