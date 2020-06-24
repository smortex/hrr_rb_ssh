RSpec.describe HrrRbSsh::Messages::SSH_MSG_CHANNEL_EXTENDED_DATA do
  let(:id){ 'SSH_MSG_CHANNEL_EXTENDED_DATA' }
  let(:value){ 95 }

  describe "::ID" do
    it "is defined" do
      expect(described_class::ID).to eq id
    end
  end

  describe "::VALUE" do
    it "is defined" do
      expect(described_class::VALUE).to eq value
    end
  end

  let(:message){
    {
      :'message number'    => value,
      :'recipient channel' => 1,
      :'data type code'    => 2,
      :'data'              => 'data',
    }
  }
  let(:payload){
    [
      HrrRbSsh::DataTypes::Byte.encode(message[:'message number']),
      HrrRbSsh::DataTypes::Uint32.encode(message[:'recipient channel']),
      HrrRbSsh::DataTypes::Uint32.encode(message[:'data type code']),
      HrrRbSsh::DataTypes::String.encode(message[:'data']),
    ].join
  }

  describe "#encode" do
    it "returns payload encoded" do
      expect(described_class.new.encode(message)).to eq payload
    end
  end

  describe "#decode" do
    it "returns message decoded" do
      expect(described_class.new.decode(payload)).to eq message
    end
  end
end
