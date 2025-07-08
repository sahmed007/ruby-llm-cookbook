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

  def extract_xml(text, tag)
    # Extracts the content of the specified XML tag from the given text
    match = text.match(/<#{tag}>(.*?)<\/#{tag}>/m)
    match ? match[1] : ""
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

  def route(input:, routes:)
    # Route input to specialized prompt using content classification.
    puts "\nAvailable routes: #{routes.keys}"

    selector_prompt = 
    "Analyze the input and select the most appropriate support team from these options: #{routes.keys}\n" +
    "First explain your reasoning, then provide your selection in this XML format:\n\n" +
    "<reasoning>\n" +
    "Brief explanation of why this ticket should be routed to a specific team.\n" +
    "Consider key terms, user intent, and urgency level.\n" +
    "</reasoning>\n\n" +
    "<selection>\n" +
    "The chosen team name\n" +
    "</selection>\n\n" +
    "Input: #{input}"

    route_response = llm_call(selector_prompt)
    reasoning = extract_xml(route_response, 'reasoning')
    route_key = extract_xml(route_response, 'selection').strip.downcase
  
    puts "Routing Analysis:"
    puts reasoning
    puts "\nSelected route: #{route_key}"
  
    # Process input with selected specialized prompt
    selected_prompt = routes[route_key]
    llm_call("#{selected_prompt}\nInput: #{input}")
  end
end