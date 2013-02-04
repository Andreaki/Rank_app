require 'test_helper'

class VoteRecordsControllerTest < ActionController::TestCase
  setup do
    @vote_record = vote_records(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:vote_records)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create vote_record" do
    assert_difference('VoteRecord.count') do
      post :create, vote_record: { ip_adress: @vote_record.ip_adress, is_like: @vote_record.is_like, name_id: @vote_record.name_id }
    end

    assert_redirected_to vote_record_path(assigns(:vote_record))
  end

  test "should show vote_record" do
    get :show, id: @vote_record
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @vote_record
    assert_response :success
  end

  test "should update vote_record" do
    put :update, id: @vote_record, vote_record: { ip_adress: @vote_record.ip_adress, is_like: @vote_record.is_like, name_id: @vote_record.name_id }
    assert_redirected_to vote_record_path(assigns(:vote_record))
  end

  test "should destroy vote_record" do
    assert_difference('VoteRecord.count', -1) do
      delete :destroy, id: @vote_record
    end

    assert_redirected_to vote_records_path
  end
end
