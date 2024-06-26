# freshdesk-rest
A simple REST Freshdesk integration

[![Build Status](https://travis-ci.org/Helpling/freshdesk-rest.svg?branch=master)](https://travis-ci.org/Helpling/freshdesk-rest)
[![Gem Version](https://badge.fury.io/rb/freshdesk-rest.svg)](https://badge.fury.io/rb/freshdesk-rest)

## Requirements
- Create a read-only API key in Freshdesk
- Set an ENV var with `FRESHDESK_API_KEY`
- Set an ENV var with `FRESHDESK_SUBDOMAIN` ("fizbuz" if your Freshdesk domain is fizbuz.freshdesk.com)

## DISCLAIMER
### This is still a BETA!
Some of the methods signatures could change. I aim to keep always backward compatibility, but until the first major version (1.x.x) is released, it's still in beta.

## Default Configuration
```ruby
Freshdesk::Rest.configure do |config|
  config.api_key = ENV['FRESHDESK_API_KEY']
  config.subdomain = ENV['FRESHDESK_SUBDOMAIN']
end

```

## Usage

### Initialize a client if the default configuration is specified
```ruby
freshdesk_client = Freshdesk::Rest::Client.new
```

### Initialize a client with specific keys
```ruby
freshdesk_client = Freshdesk::Rest::Client.new(
  api_key: ENV['FRESHDESK_API_KEY'],
  subdomain: ENV['FRESHDESK_SUBDOMAIN']
)
```

### List of contacts
```ruby
resource = freshdesk_client.contact_resource
resource.list.each do |c|
  puts "#{c[:name]} #{c[:email]} #{c[:updated_at]}"
end
```

### List of contacts filtered by a filed
```ruby
resource = freshdesk_client.contact_resource
resource.list(params: { unique_external_id: '1234567890' }).each do |c|
  puts "#{c[:name]} #{c[:email]}"
end
```

### Contact
```ruby
resource = freshdesk_client.contact_resource
resource.get(id: '1234567890').tap do |c|
  puts "#{c[:name]} #{c[:email]}"
end
```

### Create contact
```ruby
resource = freshdesk_client.contact_resource
resource.post(data: { name: 'Jon Snow', email: 'some+email@example.com' }).tap do |c|
  puts "#{c[:name]} #{c[:email]}"
end
```

### Update contact
```ruby
resource = freshdesk_client.contact_resource
resource.put(id: 1234567890, data: { email: 'other+email@example.com' }).tap do |c|
  puts "#{c[:name]} #{c[:email]}"
end
```

### Soft delete contact
```ruby
resource = freshdesk_client.contact_resource
resource.delete(id: 1234567890)
```

### Hard delete contact
```ruby
resource = freshdesk_client.contact_resource
resource.hard_delete(id: 1234567890)
```

Force delete a contact that is not soft deleted already
```ruby
resource = freshdesk_client.contact_resource
resource.hard_delete(id: 1234567890, force: true)
```

### Company
```ruby
resource = freshdesk_client.company_resource
resource.get(id: '1234567890').tap do |c|
  puts "#{c[:name]} #{c[:description]}"
end
```

### Create company
```ruby
resource = freshdesk_client.company_resource
resource.post(data: { name: 'Jon Snow', description: 'some description' }).tap do |c|
  puts "#{c[:name]} #{c[:description]}"
end
```

### Update company
```ruby
resource = freshdesk_client.company_resource
resource.put(id: 1234567890, data: { description: 'some description' }).tap do |c|
  puts "#{c[:name]} #{c[:description]}"
end
```

### Delete company
```ruby
resource = freshdesk_client.company_resource
resource.delete(id: 1234567890)
```

### Create Ticket
```ruby
resource = freshdesk_client.ticket_resource
resource.post(data: { name: 'Jon Snow', email: 'some+email@example.com', status: 2, priority: 2, source: 2 }).tap do |c|
  puts "#{c[:name]} #{c[:email]}"
end
```

## Freshdesk Api reference
https://developers.freshdesk.com/api
