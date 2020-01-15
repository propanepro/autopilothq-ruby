module Autopilot
  module Operations
    module Unsubscribe
      def self.included(klass)
        klass.extend(ClassMethods)
      end

      module ClassMethods
        def unsubscribe(contact_id_or_email, client = Autopilot.shared_client)
          json = client.post_json("/#{self.record_key}/#{contact_id_or_email}/unsubscribe")
          new(json)
        end

        def find_path(id = nil)
          single_path = "/#{record_key.to_s}"
          id ? "#{single_path}/#{id}" : single_path
        end
      end
    end
  end
end