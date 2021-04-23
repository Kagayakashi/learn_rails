 class Github::CreateGistService

  STATUS_CREATED = 201;

  def initialize(question, client: nil)
    @question = question
    @test = @question.test
    @client = client ||  Octokit::Client.new(:access_token => ENV['ACCESS_TOKEN'])
  end

  def call
    result = @client.create_gist(gist_params)
    @id = result.id
    @url = result.url
    self
  end

  def id
    @id
  end

  def url
    @url
  end

  def success?
    @client.last_response.status == STATUS_CREATED
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
