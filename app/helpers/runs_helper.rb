module RunsHelper

  def status_image(status)
    case status
      when "success" then '<div class="step-status success"><i class="fondu_015-check"></i></div>'
      when "running" then '<img src="/assets/status-running.gif"/>'
      else                ''
    end.html_safe
  end

end
