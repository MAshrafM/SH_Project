class ContactsController < ApplicationController

  skip_before_action :ensure_login
  def index
  end
end
