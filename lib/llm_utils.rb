require 'dotenv/load'
require 'ruby_llm'
require 'parallel'

RubyLLM.configure do |config|
  config.openrouter_api_key = ENV.fetch('OPENROUTER_API_KEY', nil)
end

module LLMUtils
  def llm_call(prompt, system_prompt: "", model: "meta-llama/llama-4-maverick:free")
    # Calls the model with the given prompt and returns the response
    chat = RubyLLM.chat(model: model)
      .with_temperature(0.1)
      .with_instructions(system_prompt)
  
    response = chat.ask(prompt)
    response.content
  end

  def chain(input:, prompts:)
    # Chain multiple LLM calls sequentially, passing results between steps
    result = input
    prompts.each_with_index do |prompt, i|
      puts "\nStep #{i + 1}:"
      result = llm_call("#{prompt}\nInput: #{input}")
      puts result
    end
    result
  end

  def parallel(prompt:, inputs:, n_workers: 3)
    # Process multiple inputs concurrently with the same prompt
    Parallel.map(inputs, in_threads: n_workers) do |input|
      llm_call("#{prompt}\nInput: #{input}")
    end
  end
end