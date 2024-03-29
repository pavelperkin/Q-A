require 'test_helper'

class QuestsControllerTest < ActionController::TestCase
  fixtures :quests
  setup do
    @quest = quests(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:quests)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create quest" do
    assert_difference('Quest.count') do
      post :create, quest: { answers: @quest.answers, body: @quest.body, comments: @quest.comments, likes: @quest.likes, tags: @quest.tags, theme: @quest.theme, user_id: @quest.user_id }
    end

    assert_redirected_to quest_path(assigns(:quest))
  end

  test "should show quest" do
    get :show, id: @quest
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @quest
    assert_response :success
  end

  test "should update quest" do
    put :update, id: @quest, quest: { answers: @quest.answers, body: @quest.body, comments: @quest.comments, likes: @quest.likes, tags: @quest.tags, theme: @quest.theme, user_id: @quest.user_id }
    assert_redirected_to quest_path(assigns(:quest))
  end

  test "should destroy quest" do
    assert_difference('Quest.count', -1) do
      delete :destroy, id: @quest
    end

    assert_redirected_to quests_path
  end
end
