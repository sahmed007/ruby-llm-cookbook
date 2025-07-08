class Optimizer
  def initialize(max_iterations: 3)
    @max_iterations = max_iterations
  end

  def process(task:, evaluator_prompt:, generator_prompt:)
    # Keep generating and evaluating until requirements are met
    memory = []
    chain_of_thought = []
    
    thoughts, result = generate(generator_prompt, task)
    memory << result
    chain_of_thought << { thoughts: thoughts, result: result }

    loop do
      evaulation, feedback = evaluate(evaluator_prompt, result, task)
      return [result, chain_of_thought] if evaulation == "PASS"

      context = [
        "Previous attempts:",
        *memory.map { |m| "- #{m}" },
        "\nFeedback: #{feedback}"
      ].join("\n")

      thoughts, result = generate(generator_prompt, task, context)
      memory << result
      chain_of_thought << { thoughts: thoughts, result: result }

      break if chain_of_thought.size >= @max_iterations
    end
  end

  private

  def generate(prompt, task, context = "")
    # Generate and improve a solution based on feedback
    full_prompt = if context.empty?
      "#{prompt}\nTask: #{task}"
    else
      "#{prompt}\n#{context}\nTask: #{task}"
    end

    response = llm_call(full_prompt)
    thoughts = extract_xml(response, "thoughts")
    result = extract_xml(response, "response")

    puts "\n=== GENERATION START ==="
    puts "Thoughts:\n#{thoughts}\n"
    puts "Generated:\n#{result}"
    puts "=== GENERATION END ===\n"

    [thoughts, result]
  end

  def evaluate(prompt, content, task)
    # Evaluate if a solution meets requirements
    full_prompt = "#{prompt}\nOriginal task: #{task}\nContent to evaluate: #{content}"
    response = llm_call(full_prompt)
    evaluation = extract_xml(response, "evaluation")
    feedback = extract_xml(response, "feedback")

    puts "=== EVALUATION START ==="
    puts "Status: #{evaluation}"
    puts "Feedback: #{feedback}"
    puts "=== EVALUATION END ===\n"

    [evaluation, feedback]
  end
end