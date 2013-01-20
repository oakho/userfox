require_relative "../spec_helper"

describe Userfox::Client do
  let(:client) { Userfox::Client.new("123456", "123456") }

  it "should include HTTParty" do
    Userfox::Client.should include(HTTParty)
  end

  it "should have a base uri set" do
    Userfox::Client.base_uri.should eql("https://api.userfox.com/v1")
  end
  
  describe "#track" do
    before { VCR.insert_cassette "track", record: :new_episodes }
    after { VCR.eject_cassette }
    
    context "given good credentials" do
      subject { client.track("hello@example.com", "http://www.example.com", hello: "world") }
      it { should be_success }
    end

    context "given bad credentials" do
      let(:client) { Userfox::Client.new("abcde", "abcde") }
      it { expect { client.track("hello@example.com", "http://www.example.com", hello: "world") }.to raise_error(Userfox::UnauthorizedError) }
    end
  end

  describe "#send" do
    before { VCR.insert_cassette "send", record: :new_episodes }
    after { VCR.eject_cassette }
    
    context "given good credentials" do
      subject { client.send("hello@example.com", "Password Recovery", hello: "world") }
      it { should be_success }
    end

    context "given bad credentials" do
      let(:client) { Userfox::Client.new("abcde", "abcde") }
      it { expect { client.send("http://www.example.com", "hello@example.com", hello: "world") }.to raise_error(Userfox::UnauthorizedError) }
    end
  end

  describe "#change" do
    before { VCR.insert_cassette "change", record: :new_episodes }
    after { VCR.eject_cassette }
    
    context "given good credentials" do
      subject { client.change("hello@example.com", "user@example.com") }
      it { should be_success }
    end

    context "given bad credentials" do
      let(:client) { Userfox::Client.new("abcde", "abcde") }
      it { expect { client.change("hello@example.com", "user@example.com") }.to raise_error(Userfox::UnauthorizedError) }
    end
  end

  describe "#unsubscribes" do
    before { VCR.insert_cassette "unsubscribes", record: :new_episodes }
    after { VCR.eject_cassette }
    
    context "given good credentials" do
      subject { client.unsubscribes("hello@example.com") }
      it { should be_success }
    end

    context "given bad credentials" do
      let(:client) { Userfox::Client.new("abcde", "abcde") }
      it { expect { client.unsubscribes("hello@example.com") }.to raise_error(Userfox::UnauthorizedError) }
    end
  end
end
