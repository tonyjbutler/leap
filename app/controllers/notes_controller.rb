class NotesController < ApplicationController

  def create
    a = Note.create!(params[:note])
    redirect_to person_view_url(a.person,View.where(:name => "all").select{|x| x.affiliations.include? @affiliation}.first)
  end

end
