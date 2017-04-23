require 'test_helper'

class IssueWatchesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @issue_watch = issue_watches(:one)
  end

  test "should get index" do
    get issue_watches_url
    assert_response :success
  end

  test "should get new" do
    get new_issue_watch_url
    assert_response :success
  end

  test "should create issue_watch" do
    assert_difference('IssueWatch.count') do
      post issue_watches_url, params: { issue_watch: { issue: @issue_watch.issue, user: @issue_watch.user } }
    end

    assert_redirected_to issue_watch_url(IssueWatch.last)
  end

  test "should show issue_watch" do
    get issue_watch_url(@issue_watch)
    assert_response :success
  end

  test "should get edit" do
    get edit_issue_watch_url(@issue_watch)
    assert_response :success
  end

  test "should update issue_watch" do
    patch issue_watch_url(@issue_watch), params: { issue_watch: { issue: @issue_watch.issue, user: @issue_watch.user } }
    assert_redirected_to issue_watch_url(@issue_watch)
  end

  test "should destroy issue_watch" do
    assert_difference('IssueWatch.count', -1) do
      delete issue_watch_url(@issue_watch)
    end

    assert_redirected_to issue_watches_url
  end
end
