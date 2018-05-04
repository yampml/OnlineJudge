class CloseContestJob < ApplicationJob
  queue_as :default

  def perform(contest_id)
  	@contest = Contest.find_by(id: contest_id)
  	@contest.update_attribute(:is_running, 2)
    # Do something later
  end
end
