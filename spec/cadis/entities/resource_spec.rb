RSpec.describe Resource, type: :entity do
  it 'allows a name to be set' do
    resource = Resource.new(name: 'file.txt')
    expect(resource.name).to eq('file.txt')
  end
end
