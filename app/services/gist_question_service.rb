class GistQuestionService

  def initialize(question, client: nil)
    @question = question
    @test = @question.test
    @client = client || GithubClient.new
  end

  def call
    @client.create_gists(gist_params)
  end

  private

  def gist_params
    {
      description: "A question about #{@test.title} from LearnRails",
      files: {
        'learn-rails-question.txt' => {
          content: gist_content
        }
      }
    }
  end

  def gist_content
    content = [@question.body]
    content += @question.answers.pluck(:body)
    content.join("\n")
  end

end
