require 'dotenv/load'
require_relative 'lib/llm_utils'
include LLMUtils

puts "=== RubyLLM AI Agents Cookbook ==="
puts "=========================="

# Only uncomment the example you want to run
# 
# Example 1: Prompt Chaining workflow for data processing
require_relative 'examples/prompt_chaining'
# 
# Example 2: Parallelization workflow for stakeholder impact analysis
# require_relative 'examples/parallelization'
# 
# Example 3: Routing workflow for support ticket routing
# require_relative 'examples/routing'
# 
# Example 4: Orchestrator pattern with worker specialization
# require_relative 'examples/orchestrator_workers'
# 
# Example 5: Evaluator-Optimizer pattern for code generation and optimization
# require_relative 'examples/evaluator_optimizer'

puts "=========================="
puts "=== Done ==="
