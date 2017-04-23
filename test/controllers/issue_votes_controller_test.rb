require 'test_helper'

class IssueVotesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @issue_vote = issue_votes(:one)
  end

  test "should get index" do
    get issue_votes_url
    assert_response :success
  end

  test "should get new" do
    get new_issue_vote_url
    assert_response :success
  end

  test "should create issue_vote" do
    assert_difference('IssueVote.count') do
      post issue_votes_url, params: { issue_vote: { issue: @issue_vote.issue, user: @issue_vote.user } }
    end

    assert_redirected_to issue_vote_url(IssueVote.last)
  end

  test "should show issue_vote" do
    get issue_vote_url(@issue_vote)
    assert_response :success
  end

  test "should get edit" do
    get edit_issue_vote_url(@issue_vote)
    assert_response :success
  end

  test "should update issue_vote" do
    patch issue_vote_url(@issue_vote), params: { issue_vote: { issue: @issue_vote.issue, user: @issue_vote.user } }
    assert_redirected_to issue_vote_url(@issue_vote)
  end

  test "should destroy issue_vote" do
    assert_difference('IssueVote.count', -1) do
      delete issue_vote_url(@issue_vote)
    end

    assert_redirected_to issue_votes_url
  end
end
