FactoryBot.define do
  factory :report_item do
    report
    type { 'DeliveredReportItem' }
    title { 'Title' }
    description { 'Description' }
  end
end
