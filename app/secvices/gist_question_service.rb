class GistQuestionService

  def initialize(question, client: nil)
    @question = question
    @test = @question.test
    @client = client || Octokit::Client.new
  end

  def call
    @client.create_gist(gist_params)
  end

  def status_ok?
    @client.last_response.status == 201
  end

  private

  def gist_params
    {
      "description": I18n.t('gist_params', test: @test.title),
      "public": true,
      "files": {
        "test_guru_question.txt" => {
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
