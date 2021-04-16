 class GistService
  attr_reader :question

  def initialize(client: nil)
    @client = client ||  Octokit::Client.new(:access_token => ENV['ACCESS_TOKEN'])
  end

  def question=(question)
    @question = question
    @test = @question.test
  end

  def create_gist
    @client.create_gist(gist_params)
  end

  def created_gists
    @gists = @client.gists(@client.login)
  end

  def success?
    [200, 201, 202, 203, 204, 205, 206, 207, 208].include?(@client.last_response.status)
  end

  private

  def gist_params
    {
      description: I18n.t('services.gist.question_about', test: @test.title),
      files: {
        I18n.t('services.gist.file_name') => {
          content: gist_content
        }
      },
      public: true
    }
  end

  def gist_content
    content = [@question.body]
    content += @question.answers.pluck(:body)
    content.join("\n")
  end

end
