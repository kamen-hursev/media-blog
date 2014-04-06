require 'test_helper'

class ReportTest < ActiveSupport::TestCase
  test 'should not allow an invalid report' do
    report = Report.new
    picture = Picture.new
    picture.title = ':-)'
    6.times do
      report.pictures << picture
    end
    assert report.invalid?
    assert report.errors[:title].any?, 'report without a title is valid'
    assert report.errors[:slug].any?, 'report without a slug is valid'
    assert report.errors[:category].any?, 'report without a category is valid'
    assert report.errors[:body].any?, 'report without a body is valid'
    assert report.errors[:user].any?, 'report without a user/owner is valid'
    assert report.errors[:pictures].any?, 'report without a user/owner is valid'
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
    assert report.valid?, report.errors.reduce { |a, e| a + ' ' + e.message }
  end

  test 'should mark pictures without file and id as invalid' do
    report = Report.new
    assert report.send(:invalid_picture?, 'title' => ':-)'),
           'picture without id and file is valid'
    assert !report.send(:invalid_picture?, 'title' => ':-)', 'id' => 4),
           'picture with id is not valid'
    assert !report.send(:invalid_picture?, 'file' => ':-)')
  end

  test 'should suggest slug' do
    report = Report.new title: 'Some test Report     title'
    assert_equal 'some_test_report_title', report.slug_suggestion
  end

  test 'should not suggest slug if already exists' do
    report = Report.new title: 'What is going on in Sochi'
    assert_equal nil, report.slug_suggestion
  end
end
