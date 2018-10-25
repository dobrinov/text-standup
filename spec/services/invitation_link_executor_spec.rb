require 'rails_helper'

describe InvitationLinkExecutor do
  let(:user) { create :user }
  let(:team) { create :team }
  let(:invitation_link) { create :invitation_link, team: team }

  around do |example|
    Timecop.freeze { example.run }
  end

  it 'adds user to a team' do
    InvitationLinkExecutor.execute invitation_link, user

    team.members.should eq [user]
  end

  it 'marks the invitation link as used' do
    expect do
      InvitationLinkExecutor.execute invitation_link, user
    end.to change(invitation_link, :used_at).from(nil).to(Time.current)
  end

  it 'records the invited user in the invitation' do
    expect do
      InvitationLinkExecutor.execute invitation_link, user
    end.to change(invitation_link, :invited_user).from(nil).to(user)
  end
end