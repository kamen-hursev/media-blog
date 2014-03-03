require 'test_helper'

class ReportTest < ActiveSupport::TestCase
  test 'should not allow an invalid report' do
    report = Report.new
    assert report.invalid?
    assert report.errors[:title].any?, 'report without a title is valid'
    assert report.errors[:slug].any?, 'report without a slug is valid'
    assert report.errors[:category].any?, 'report without a category is valid'
    assert report.errors[:body].any?, 'report without a body is valid'
    assert report.errors[:user].any?, 'report without a user/owner is valid'
  end

  test 'should not allow two reports with the same slug' do
    report = Report.new(slug: reports(:sochi).slug)
    assert report.invalid?
    assert report.errors[:slug].any?, 'report with existing slug is valid'
  end

  test 'should allow a report with valid fields' do
    report = Report.new(
      title: 'test title',
      slug: 'slug_written',
      body: 'some body text goes here',
      user: users(:john),
      category: categories(:sport)
    )
    assert report.valid?, report.errors.reduce {|r, i| r + ' ' + i.message}
  end
end
