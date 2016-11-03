http_stub_example
-----------------

An example of a stub HTTP API using [http_stub](https://github.com/MYOB-Technology/http_stub).

The scenarios in this example, which can also be thought of as contracts, are verified by [http_stub_example_producer](https://github.com/MYOB-Technology/http_stub_example_producer). 

### Status
[![Build Status](https://travis-ci.org/MYOB-Technology/http_stub_example.png)](https://travis-ci.org/MYOB-Technology/http_stub_example)
[![Code Climate](https://codeclimate.com/github/MYOB-Technology/http_stub_example/badges/gpa.svg)](https://codeclimate.com/github/MYOB-Technology/http_stub_example)
[![Test Coverage](https://codeclimate.com/github/MYOB-Technology/http_stub_example/badges/coverage.svg)](https://codeclimate.com/github/MYOB-Technology/http_stub_example/coverage)
[![Dependency Status](https://gemnasium.com/MYOB-Technology/http_stub_example.png)](https://gemnasium.com/MYOB-Technology/http_stub_example)

### Usage
1. Install [Docker](https://www.docker.com/)
2. `rake docker:build`
3. `rake docker:start`
4. Stub is available on ```http://localhost:5000```
