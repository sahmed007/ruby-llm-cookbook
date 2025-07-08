# Example 5: Evaluator-Optimizer pattern for code generation and optimization
# In this workflow, one LLM call generates a response while another provides evaluation and feedback in a loop

require_relative '../lib/optimizer'

evaluator_prompt = <<~EVAL
  Evaluate this following code implementation for:
  1. code correctness
  2. time complexity
  3. style and best practices

  You should be evaluating only and not attemping to solve the task.
  Only output "PASS" if all criteria are met and you have no further suggestions for improvements.
  Output your evaluation concisely in the following format.

  <evaluation>PASS, NEEDS_IMPROVEMENT, or FAIL</evaluation>
  <feedback>
  What needs improvement and why.
  </feedback>
EVAL

generator_prompt = <<~GEN
  Your goal is to complete the task based on <user input>. If there are feedback 
  from your previous generations, you should reflect on them to improve your solution

  Output your answer concisely in the following format: 

  <thoughts>
  [Your understanding of the task and feedback and how you plan to improve]
  </thoughts>

  <response>
  [Your code implementation here]
  
GEN

task = <<~TASK
  <user input>
  Implement a Stack with:
  1. push(x)
  2. pop()
  3. getMin()
  All operations should be O(1).
  </user input>
TASK

Optimizer.new.process(
  task: task,
  evaluator_prompt: evaluator_prompt,
  generator_prompt: generator_prompt
)