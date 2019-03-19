RSpec.describe ApplicationController, type: :controller do
  it { should filter_param(:secret_key) }
end