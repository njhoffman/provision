GET https://example.org

HTTP 200
Last-Modified: Wed, 21 Oct 2015 07:28:00 GMT
[Asserts]
xpath "normalize-space(//head/title)" startsWith "Welcome"
xpath "//li" count == 18

# An example to show how to pass a CSRF token
# from one request to another:

# First GET request to get CSRF token value:
GET https://example.org

HTTP 200
# Capture the CSRF token value from html body.
[Captures]
csrf_token: xpath "normalize-space(//meta[@name='_csrf_token']/@content)"


# Do the login !
POST https://acmecorp.net/login?user=toto&password=1234
X-CSRF-TOKEN: {{csrf_token}}
HTTP 302

# status capture
GET https://example.org

HTTP 200
[Captures]
my_status: status

# header capture
POST https://example.org/login
[FormParams]
user: toto
password: 12345678

HTTP 302
[Captures]
next_url: header "Location"

# url capture
GET https://example.org/redirecting
[Options]
location: true

HTTP 200
[Captures]
landing_url: url

# body capture
GET https://example.org/home

HTTP 200
[Captures]
my_body: body

# cookie cpature
GET https://example.org/cookies/set

HTTP 200
[Captures]
value1: cookie "LSID"
value2: cookie "LSID[Value]"     # Equivalent to the previous capture
expires: cookie "LSID[Expires]"
max-age: cookie "LSID[Max-Age]"
domain: cookie "LSID[Domain]"
path: cookie "LSID[Path]"
secure: cookie "LSID[Secure]"
http-only: cookie "LSID[HttpOnly]"
same-site: cookie "LSID[SameSite]"
