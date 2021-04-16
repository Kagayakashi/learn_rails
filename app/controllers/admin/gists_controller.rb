class Admin::GistsController < Admin::BaseController
  def index
    @gists = Gist.all
  end

  def github
    @gists = GistService.new.created_gists
  end
end
