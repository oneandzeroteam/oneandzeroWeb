# app/controllers/github_webhooks_controller.rb
class GithubWebhooksController < ActionController::Base
  include GithubWebhook::Processor

  # Handle push event
  def github_push(payload)
    # TODO: handle push webhook
  end

  # Handle create event
  def github_create(payload)
    # TODO: handle create webhook
  end

  def webhook_secret(payload)
    ENV['GITHUB_WEBHOOK_SECRET']
  end
end