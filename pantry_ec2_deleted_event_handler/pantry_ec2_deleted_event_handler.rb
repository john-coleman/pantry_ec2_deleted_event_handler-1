module Wonga
  module Daemon
    class PantryEc2DeletedEventHandler
      def initialize(api_client, logger)
        @logger = logger
        @api_client = api_client
      end

      def handle_message(message)
        @logger.info "Updating deleted status for Request:#{message['pantry_request_id']}, Name:#{message['instance_name']}, InstanceID:#{message['instance_id']}"
        message[:terminated] = true
        @api_client.send_put_request("/api/ec2_instances/#{message['id']}", message)
      end
    end
  end
end
