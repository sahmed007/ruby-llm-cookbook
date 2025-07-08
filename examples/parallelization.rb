# Example 2: Parallelization workflow for stakeholder impact analysis
# Process impact analysis for multiple stakeholder groups concurrently

stakeholders = [
  "Customers:\n- Price sensitive\n- Want better tech\n- Environmental concerns",
  "Employees:\n- Job security worries\n- Need new skills\n- Want clear direction",
  "Investors:\n- Expect growth\n- Want cost control\n- Risk concerns",
  "Suppliers:\n- Capacity constraints\n- Price pressures\n- Tech transitions"
]

impact_prompt = "Analyze how market changes will impact this stakeholder group.\n" \
  "Provide specific impacts and recommended actions.\n" \
  "Format with clear sections and priorities."

impact_results = parallel(prompt: impact_prompt, inputs: stakeholders)

impact_results.each do |result|
  puts result
  puts "+" * 80
end