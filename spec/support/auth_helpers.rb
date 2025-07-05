module AuthHelpers
  def mock_clerk_authentication(user)
    # Mock the request to Clerk's API for any user ID
    stub_request(:get, %r{https://api\.clerk\.com/v1/users/.*})
      .with(
        headers: {
          'Accept' => 'application/json',
          'Accept-Encoding' => 'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
          'Authorization' => /Bearer .*/,
          'Content-Type' => 'application/json',
          'User-Agent' => 'OpenAPI-Generator/2.0.0/ruby'
        }
      )
      .to_return(
        status: 200,
        body: {
          id: user.clerk_id,
          email_addresses: [ { email_address: 'user@example.com' } ],
          first_name: 'Test',
          last_name: 'User'
        }.to_json,
        headers: { 'Content-Type' => 'application/json' }
      )

    # Mock the controller methods
    allow_any_instance_of(ApplicationController)
      .to receive(:clerk)
      .and_return(OpenStruct.new(user_id: user.clerk_id))
    allow_any_instance_of(ApplicationController)
      .to receive(:clerk_user)
      .and_return(OpenStruct.new(email: 'user@example.com', first_name: 'Test', last_name: 'User'))
  end

  def mock_clerk_org_authentication(user, org)
    # Mock the request to Clerk's API for user
    stub_request(:get, %r{https://api\.clerk\.com/v1/users/.*})
      .with(
        headers: {
          'Accept' => 'application/json',
          'Accept-Encoding' => 'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
          'Authorization' => /Bearer .*/,
          'Content-Type' => 'application/json',
          'User-Agent' => 'OpenAPI-Generator/2.0.0/ruby'
        }
      )
      .to_return(
        status: 200,
        body: {
          id: user.clerk_id,
          email_addresses: [ { email_address: 'user@example.com' } ],
          first_name: 'Test',
          last_name: 'User'
        }.to_json,
        headers: { 'Content-Type' => 'application/json' }
      )

    # Mock the request to Clerk's API for organization
    stub_request(:get, %r{https://api\.clerk\.com/v1/organizations/.*})
      .with(
        headers: {
          'Accept' => 'application/json',
          'Accept-Encoding' => 'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
          'Authorization' => /Bearer .*/,
          'Content-Type' => 'application/json',
          'User-Agent' => 'OpenAPI-Generator/2.0.0/ruby'
        }
      )
      .to_return(
        status: 200,
        body: {
          id: org.clerk_org_id
        }.to_json,
        headers: { 'Content-Type' => 'application/json' }
      )

    # Mock the controller methods
    allow_any_instance_of(ApplicationController)
      .to receive(:clerk)
      .and_return(OpenStruct.new(user_id: user.clerk_id, organization_id: org.clerk_org_id))
    allow_any_instance_of(ApplicationController)
      .to receive(:clerk_user)
      .and_return(OpenStruct.new(email: 'user@example.com', first_name: 'Test', last_name: 'User'))
  end
end

RSpec.configure do |config|
  config.include AuthHelpers, type: :request
end
