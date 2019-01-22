require 'rails_helper'

describe ReportCreator do
  it 'creates a morning report' do
    user = create :user
    items = [
      {title: 'Title', description: 'Description', type: 'OngoingReportItem'},
      {title: 'Title', description: 'Description', type: 'PlannedReportItem'},
      {title: 'Title', description: 'Description', type: 'BlockerReportItem'},
      {title: 'Title', description: 'Description', type: 'AnnouncementReportItem'},
    ]

    Report.count.should eq 0
    ReportItem.count.should eq 0

    ReportCreator.execute MorningReport, user, items

    Report.count.should eq 1
    ReportItem.count.should eq 4
  end

  it 'creates a delivery report' do
    user = create :user
    items = [{title: 'Title', description: 'Description', type: 'DeliveredReportItem'}]

    Report.count.should eq 0
    ReportItem.count.should eq 0

    ReportCreator.execute MorningReport, user, items

    Report.count.should eq 1
    ReportItem.count.should eq 1
  end

  it 'raises error when creating a report with no items' do
    user = create :user
    items = []

    expect do
      ReportCreator.execute MorningReport, user, items
    end.to raise_error ReportCreator::EmptyReportError
  end
end
