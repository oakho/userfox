require "spec_helper"

describe Userfox do
  describe ".new" do
    it "returns a Userfox client" do
      Userfox.new("12345", "98765").should be_an_instance_of(Userfox::Client)
    end
  end
end
