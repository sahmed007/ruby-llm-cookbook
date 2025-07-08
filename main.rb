require 'dotenv/load'
require_relative 'lib/llm_utils'
include LLMUtils

puts "=== RubyLLM AI Agents Cookbook ==="
puts "=========================="

# Uncomment the examples you want to run
require_relative 'examples/prompt_chaining'

puts "=== Done ==="
