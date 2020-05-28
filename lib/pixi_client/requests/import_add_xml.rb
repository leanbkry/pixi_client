module PixiClient
  module Requests
    class ImportAddXML < Base
      attr_accessor :xml, :operationType, :channelRef

      def initialize(xml, operationType, channelRef)
        self.xml = xml
        self.operationType = xml
        self.channelRef = channelRef
      end

      def api_method
        :pixi_import_add_xml
      end

      def message
        { 'ChannelRef' => channelRef, 'OperationType' => operationType, 'XML' => xml }
      end
    end
  end
end