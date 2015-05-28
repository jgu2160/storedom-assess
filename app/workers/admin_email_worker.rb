class AdminEmailWorker
  include Sidekiq::Worker

  def perform(id)
    AdminMailer.email_order(id)
  end
end
