require 'spec_helper'
require_relative '../../pantry_ec2_deleted_event_handler/pantry_ec2_deleted_event_handler'

describe Wonga::Daemon::PantryEc2DeletedEventHandler do
  it_behaves_like 'handler'
  describe "#handle_message" do
    #add in unit test code for handle message here.
  end
end

