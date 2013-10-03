module Wonga
  module Daemon
    class PantryEc2DeletedEventHandler
      def initialize(api_client, logger)
        @logger = logger
        @api_client = api_client
      end

      def handle_message(message)
        @logger.info "Updating deleted status for Request:#{message['pantry_request_id']}, Name:#{message['instance_name']}, InstanceID:#{message['instance_id']}"
        @api_client.update_ec2_instance(message['pantry_request_id'], { terminated: true, instance_id: message['instance_id'] })
        @logger.info "Updating deleted joined status for Request:#{message['pantry_request_id']} succeeded"
      end
    end
  end
end
