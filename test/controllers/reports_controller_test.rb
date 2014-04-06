require 'test_helper'

class ReportsControllerTest < ActionController::TestCase
  setup do
    @report = reports(:president)
  end

  test 'should get index' do
    get :index
    assert_response :success
    assert_not_nil assigns(:reports)
  end

  test 'should get new' do
    sign_in users(:ema)
    get :new
    assert_response :success
  end

  test 'should create report' do
    user = users(:john)
    sign_in user

    assert_difference('Report.count') do
      post :create, report: { body: 'test body', slug: 'some_report_title' + user.id.to_s,
                              title: 'Some Report Title' + user.id.to_s,
                              category_id: categories(:sport).id }
    end

    assert_redirected_to :reports
  end

  test 'should not create report with existing slug' do
    user = users(:john)
    sign_in user

    post :create, report: { body: 'test body', slug: 'what_is_going_on_in_sochi',
                            title: 'Some Report Title' + user.id.to_s,
                            category_id: categories(:sport).id }
    assert_response :success
    assert_template :new
  end

  test 'should show report' do
    get :show, id: @report
    assert_response :success
  end

  test 'should get edit' do
    user = users(:john)
    sign_in user

    report = user.admin ? @report : user.reports.first
    get :edit, id: report
    assert_response :success
  end

  test 'should update report' do
    user = users(:john)
    sign_in user

    report = user.reports.first
    patch :update, id: report, report: {
      body: report.body,
      slug: report.slug + user.id.to_s,
      title: report.title + user.id.to_s
    }
    assert_redirected_to report_path(assigns(:report))
  end

  test 'should not update report with existing slug' do
    user = users(:john)
    sign_in user

    report = user.reports.first
    patch :update, id: report, report: {
      body: report.body,
      slug: 'what_is_going_on_in_sochi',
      title: report.title + user.id.to_s
    }
    assert_response :success
    assert_template :edit
  end

  test 'should not update report if not owned' do
    user = users(:john)
    sign_in user

    report = Report.where(slug: 'what_is_going_on_in_sochi').first
    patch :update, id: report, report: {
      body: report.body,
      slug: report.slug + user.id.to_s,
      title: report.title + user.id.to_s
    }
    assert_response 302
  end

  test 'admin should destroy any report' do
    sign_in :user, users(:admin)
    report = Report.first

    assert_difference('Report.all.count', -1) do
      delete :destroy, id: report
    end

    assert_redirected_to reports_path
  end

  test 'use should destroy own report' do
    sign_in :user, users(:john)
    report = users(:john).reports.first

    assert_difference('Report.all.count', -1) do
      delete :destroy, id: report
    end

    assert_redirected_to reports_path
  end

  test 'should get slug suggestion' do
    sign_in :user, users(:john)
    get :slug_suggestion, title: 'some title', format: :json
    assert_response :success
  end
end
