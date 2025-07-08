# Building Effective Agents with Ruby

A collection of Anthropic-inspired examples showcasing how to build AI Agents with Ruby.

This repository contains implementations of common agent
workflows discussed in Anthropic's blog post, [Building Effective Agents](https://www.anthropic.com/engineering/building-effective-agents).

The code here is primarily a rewrite of the sample code
that was originally written in Python by Erik Schluntz and Barry Zhang [here](https://github.com/anthropics/anthropic-cookbook/tree/main/patterns/agents).

## Installation

Clone the repo and run `bundle install` to install dependencies.

```bash
bundle install
```

## Usage

These examples use OpenRouter API for LLM calls. You will need to set up an OpenRouter API key by creating a `.env` file using the `.env.example` as a template.

If you would like to use a different LLM provider, you can modify the `llm_utils.rb` file to use a different LLM provider along with the model of your choice as well. In these
examples, the `meta-llama/llama-4-scout` model is used.

The LLM calls are made using the [RubyLLM](https://github.com/crmne/ruby_llm) gem. To see the complete list of models, you can go [here](https://rubyllm.com/guides/available-models).

In the `main.rb` file, you will see examples of different
agent workflows. Simply uncomment the example you want to run as such:

```ruby
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
```

Then run your selected example with `ruby main.rb`.

## Contributing

Pull requests are always welcome.

## License

[MIT](https://choosealicense.com/licenses/mit/)