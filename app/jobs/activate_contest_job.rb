class ActivateContestJob < ApplicationJob
  queue_as :default

  def perform(contest_id)
    # Do something later
    @contest = Contest.find_by(id: contest_id)
    @contest.update_attribute(:is_running, 1)
    ActiveJob::CloseContestJob.set(wait_until: @contest.start_time + @contest.duration).perform_later(@contest.id)
  end
end
