# Example 4: Orchestrator pattern with worker specialization
# Break down a task into multiple subtasks and delegate to workers before synthesizing their results

require_relative '../lib/orchestrator'

orchestrator_prompt = <<~PROMPT
  Analyze this task and break it down into 2-3 distinct approaches:

  User Task: `%{task}`

  Return your response in this format:

  <analysis>
  Explain your understanding of the task and which variations would be valuable.
  Focus on how each approach serves different aspects of the task.
  </analysis>
  
  <tasks>
      <task>
      <type>formal</type>
      <description>Write a precise, technical version that emphasizes specifications</description>
      </task>
      <task>
      <type>conversational</type>
      <description>Write an engaging, friendly version that connects with readers</description>
      </task>
  </tasks>
PROMPT

worker_prompt = <<~PROMPT
  Generate content based on:
  Task: `%{original_task}`
  Style: `%{task_type}`
  Guidelines: `%{task_description}`

  Return your response in this format:

  <response>
  Your content here, maintaining the specified style and fully addressing requirements.
  </response>
PROMPT

orchestrator = Orchestrator.new(
  orchestrator_prompt: orchestrator_prompt,
  worker_prompt: worker_prompt
)

results = orchestrator.process(
  task: "Write a product description for a new eco-friendly water bottle",
  context: {
    target_audience: "environmentally conscious millennials",
    key_features: ["plastic-free", "insulated", "lifetime warranty"]
  }
)

puts "\n=== ORCHESTRATOR ANALYSIS ===\n#{results[:analysis]}\n"
puts "\n=== WORKER RESULTS ===\n"
results[:worker_results].each do |result|
  puts "\n=== #{result[:type]} ===\n#{result[:result]}\n"
end
