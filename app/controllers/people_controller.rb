class PeopleController < ApplicationController
  # # Be sure to include AuthenticationSystem in Application Controller instead
  # include AuthenticatedSystem
  # # If you want "remember me" functionality, add this before_filter to Application Controller
  # before_filter :login_from_cookie
  
  layout 'authentication'
  skip_before_filter :login_required, :only => %w[new create]
  
  
  # render new.rhtml
  def new
  end

  def create
    @person = Person.new(params[:person])
    @person.save!
    self.current_person = @person
    redirect_back_or_default('/')
    flash[:notice] = "Thanks for signing up!"
  rescue ActiveRecord::RecordInvalid
    render :action => 'new'
  end

end
