data_processing_steps = [
  "Extract only the numerical values and their associated metrics from the text.\n" \
  "Format each as 'value: metric' on a new line.\n" \
  "Example format:\n" \
  "92: customer satisfaction\n" \
  "45%: revenue growth",

  "Convert all numerical values to percentages where possible.\n" \
  "If not a percentage or points, convert to decimal (e.g., 92 points -> 92%).\n" \
  "Keep one number per line.\n" \
  "Example format:\n" \
  "92%: customer satisfaction\n" \
  "45%: revenue growth",

  "Sort all lines in descending order by numerical value.\n" \
  "Keep the format 'value: metric' on each line.\n" \
  "Example:\n" \
  "92%: customer satisfaction\n" \
  "87%: employee satisfaction",

  "Format the sorted data as a markdown table with columns:\n" \
  "| Metric | Value |\n" \
  "|:--|--:|\n" \
  "| Customer Satisfaction | 92% |"
]

report = 
  "Q3 Performance Summary:\n" \
  "Our customer satisfaction score rose to 92 points this quarter.\n" \
  "Revenue grew by 45% compared to last year.\n" \
  "Market share is now at 23% in our primary market.\n" \
  "Customer churn decreased to 5% from 8%.\n" \
  "New user acquisition cost is $43 per user.\n" \
  "Product adoption rate increased to 78%.\n" \
  "Employee satisfaction is at 87 points.\n" \
  "Operating margin improved to 34%."

puts "\nInput text:"
puts report
formatted_result = chain(report, data_processing_steps)

puts "\nFormatted result:"
puts formatted_result