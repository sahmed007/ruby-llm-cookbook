class Orchestrator
  attr_reader :orchestrator_prompt, :worker_prompt

  def initialize(orchestrator_prompt:, worker_prompt:)
    @orchestrator_prompt = orchestrator_prompt
    @worker_prompt = worker_prompt
  end

  def process(task:, context: {})
    context ||= {}

    # Step 1: Orchestrator Phase
    orchestrator_input = format_prompt(orchestrator_prompt, { task: task }.merge(context))
    orchestrator_response = llm_call(orchestrator_input)

    analysis = extract_xml(orchestrator_response, "analysis")
    tasks_xml = extract_xml(orchestrator_response, "tasks")
    tasks = parse_tasks(tasks_xml)

    puts "\n=== ORCHESTRATOR OUTPUT ==="
    puts "\nANALYSIS:\n#{analysis}"
    puts "\nTASKS:\n#{tasks}"

    # Step 2: Worker Phase
    worker_results = tasks.map do |task_info|
      worker_input = format_prompt(worker_prompt, {
        original_task: task,
        task_type: task_info['type'],
        task_description: task_info['description']
      }.merge(context))
      
      worker_response = llm_call(worker_input)
      result = extract_xml(worker_response, "response")

      puts "\n=== WORKER RESULT (#{task_info['type']}) ===\n#{result}\n"

      { type: task_info['type'], description: task_info['description'], result: result }
    end

    { analysis: analysis, worker_results: worker_results }
  end

  private

  def format_prompt(template, variables)
    raise ArgumentError, "Prompt template cannot be nil" if template.nil?
    begin
      template % variables
    rescue KeyError => e
      raise ArgumentError, "Missing required prompt variable: #{e.message}"
    end
  end
end