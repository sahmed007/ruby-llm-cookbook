require 'dotenv/load'
require_relative 'lib/llm_utils'
include LLMUtils

puts "=== RubyLLM AI Agents Cookbook ==="
puts "=========================="

# Only uncomment the example you want to run
# require_relative 'examples/prompt_chaining'
# require_relative 'examples/parallelization'
# require_relative 'examples/routing'
# require_relative 'examples/orchestrator_workers'
require_relative 'examples/evaluator_optimizer'

puts "=========================="
puts "=== Done ==="
