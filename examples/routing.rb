# Example 3: Route workflow for customer support ticket handling
# Route support tickets to appropriate teams based on content analysis

support_routes = {
    "billing" => "You are a billing support specialist. Follow these guidelines:\n" +
    "1. Always start with \"Billing Support Response:\"\n" +
    "2. First acknowledge the specific billing issue\n" +
    "3. Explain any charges or discrepancies clearly\n" +
    "4. List concrete next steps with timeline\n" +
    "5. End with payment options if relevant\n\n" +
    "Keep responses professional but friendly.\n\n" +
    "Input: ",

    "technical" => "You are a technical support engineer. Follow these guidelines:\n" +
    "1. Always start with \"Technical Support Response:\"\n" +
    "2. List exact steps to resolve the issue\n" +
    "3. Include system requirements if relevant\n" +
    "4. Provide workarounds for common problems\n" +
    "5. End with escalation path if needed\n\n" +
    "Use clear, numbered steps and technical details.\n\n" +
    "Input: ",

    "account" => "You are an account security specialist. Follow these guidelines:\n" +
    "1. Always start with \"Account Support Response:\"\n" +
    "2. Prioritize account security and verification\n" +
    "3. Provide clear steps for account recovery/changes\n" +
    "4. Include security tips and warnings\n" +
    "5. Set clear expectations for resolution time\n\n" +
    "Maintain a serious, security-focused tone.\n\n" +
    "Input: ",

    "product" => "You are a product specialist. Follow these guidelines:\n" +
    "1. Always start with \"Product Support Response:\"\n" +
    "2. Focus on feature education and best practices\n" +
    "3. Include specific examples of usage\n" +
    "4. Link to relevant documentation sections\n" +
    "5. Suggest related features that might help\n\n" +
    "Be educational and encouraging in tone.\n\n" +
    "Input: "
}

# Test with different support tickets
tickets = [
    "Subject: Can't access my account\n" +
    "Message: Hi, I've been trying to log in for the past hour but keep getting an 'invalid password' error. \n" +
    "I'm sure I'm using the right password. Can you help me regain access? This is urgent as I need to \n" +
    "submit a report by end of day.\n" +
    "- John",

    "Subject: Unexpected charge on my card\n" +
    "Message: Hello, I just noticed a charge of $49.99 on my credit card from your company, but I thought\n" +
    "I was on the $29.99 plan. Can you explain this charge and adjust it if it's a mistake?\n" +
    "Thanks,\n" +
    "Sarah",

    "Subject: How to export data?\n" +
    "Message: I need to export all my project data to Excel. I've looked through the docs but can't\n" +
    "figure out how to do a bulk export. Is this possible? If so, could you walk me through the steps?\n" +
    "Best regards,\n" +
    "Mike"
]

puts "Processing support tickets...\n"
tickets.each_with_index do |ticket, i|
  puts "\nTicket #{i + 1}:"
  puts "-" * 40
  puts ticket
  puts "\nResponse:"
  puts "-" * 40
  response = route(input: ticket, routes: support_routes)
  puts response
  puts "+" * 80
end