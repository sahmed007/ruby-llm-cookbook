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