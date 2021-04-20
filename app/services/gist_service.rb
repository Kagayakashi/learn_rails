 class GistService

  STATUS_CREATED = 201;

  def initialize(question, client: nil)
    @question = question
    @test = @question.test
    @client = client ||  Octokit::Client.new(:access_token => ENV['ACCESS_TOKEN'])
  end

  def create_gist
    @client.create_gist(gist_params)
  end

  def success?
    @client.last_response.status == 201
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
    [@question.body, *@question.answers.pluck(:body)].join("\n")
  end

end
