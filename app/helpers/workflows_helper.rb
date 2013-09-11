module WorkflowsHelper

  def last_step_num(workflow)
    workflow.steps.sort_by(&:num).last.num
  end

  def step_header(step)
    output = "<li class='num'>Step #{num}</li>"
    Step::TYPES.each do |key, val|
      output << "<li ><a data-toggle='tab' href='#step#{step.num}-#{key}'>#{val}</a></li>"
    end
    output
  end

  def friendly_last_run(workflow)
    time_ago_in_words(workflow.latest_run.finished_at) + " ago"
  end

  def friendly_duration(workflow)
    duration = workflow.latest_run.duration
    h = (duration / 3600).to_i; duration %= 3600
    m = (duration / 60).to_i; duration %= 60
    s = duration.to_i
    str = "#{s}s"
    str = "#{m}m#{str}" if m > 0
    str = "#{h}h#{str}" if h > 0
    str
  end

  def friendly_state(workflow)
    workflow.latest_run.state.humanize
  end

  def github_repository_collection(user)
    return nil unless user.github
    user.github.repos.all.map(&:full_name)
  end

end
