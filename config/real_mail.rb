# Using URI and Net:HTTP which are already included with Rails

uri = URI('https://realemail.expeditedaddons.com')

# Change the input parameters here
uri.query = URI.encode_www_form({
	api_key: 'JESW165OP8086L3DM9AG12QNCV5KY74B2R304F7XTUI9ZH',
	email: 'email@example.org',
	fix_typos: false
})

# Results are returned as a JSON object
result = JSON.parse(Net::HTTP.get_response(uri).body)

# For reference, here are all the outputs

# If the email address passes all tests for syntax, domain validity, disposability and free email
result['valid']

# If the domain of the email address is valid and functional
result['domain_error']

# The domain evaluated for validity
result['domain']

# If the evaluated email is from a free email service
result['is_freemail']

# If the email address had a syntax error (missing @ symbol, etc.)
result['syntax_error']

# The email that was evaluated
result['email']

# If the email is from a disposable email service.
result['is_disposable']

# True if typos have been fixed
result['typos_fixed']
