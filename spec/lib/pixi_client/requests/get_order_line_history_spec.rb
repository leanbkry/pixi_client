require 'spec_helper'

describe PixiClient::Requests::GetOrderLineHistory do
  let(:order_line_key) { 1 }
  subject { PixiClient::Requests::GetOrderLineHistory.new(order_line_key) }

  before do
    set_default_config
  end

  it { is_expected.to be_a_kind_of(PixiClient::Requests::Base) }

  describe '#api_method' do
    it 'should return :pixi_get_orderline_history' do
      expect(subject.api_method).to eq :pixi_get_orderline_history
    end
  end

  describe 'call behaviour' do
    let(:expected_response) { double(body: { pixi_get_orderline_history_response: { pixi_get_orderline_history_result: sql_row_set_response_mock } }) }
    let(:double_client) { double }

    before do
      allow(subject).to receive(:client).and_return(double_client)
    end

    it 'should call the client with the appropriate parameters' do
      expect(double_client).to receive(:call)
      .with(:pixi_get_orderline_history, attributes: { xmlns: PixiClient.configuration.endpoint }, message: { 'OrderlineKey' => order_line_key})
      .and_return(expected_response)

      subject.call
    end

    it 'should instanciate an instance of Response with the response body' do
      expect(double_client).to receive(:call).and_return(expected_response)
      expect(PixiClient::Response).to receive(:new).with(:pixi_get_orderline_history, expected_response.body)
      subject.call
    end

    it 'should return an instance of Response' do
      expect(double_client).to receive(:call).and_return(expected_response)
      expect(subject.call).to be_an_instance_of(PixiClient::Response)
    end
  end

end
