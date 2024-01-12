# Run a POST request with form parameters section:
POST https://example.org/test
[FormParams]
name: John Doe
key1: value1

# Run the same POST request with a body section:
POST https://example.org/test
Content-Type: application/x-www-form-urlencoded
`name=John%20Doe&key1=value1`
