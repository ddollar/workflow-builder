module WorkflowsHelper

  def step_header(step)
    output = "<li class='num'>Step #{num}</li>"
    Step::TYPES.each do |key, val|
      output << "<li ><a data-toggle='tab' href='#step#{step.num}-#{key}'>#{val}</a></li>"
    end
    output
  end

end
