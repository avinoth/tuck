require 'rails_helper'

RSpec.describe App, type: :model do
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:smtp_key) }
  it { should validate_presence_of(:smtp_secret) }
  it { should validate_presence_of(:smtp_address) }
  it { should validate_presence_of(:smtp_port) }
  it { should validate_presence_of(:smtp_authentication) }

end
