module Github

  STATUS_CREATED = 201

  CreatedGist = Struct.new(:id, :url, :status) do
    def success?
      status == STATUS_CREATED
    end
  end

  class CreateGistService

    def initialize(question, client: nil)
      @question = question
      @test = @question.test
      @client = client || Octokit::Client.new(:access_token => ENV['ACCESS_TOKEN'])
    end

    def call
      result = @client.create_gist(gist_params)
      CreatedGist.new(result.id, set_gist_url(result.id), @client.last_response.status)
    end

    private

    def set_gist_url(hash)
      username = ENV['GIST_USERNAME']
      "https://gist.github.com/#{username}/#{hash}"
    end

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
end
