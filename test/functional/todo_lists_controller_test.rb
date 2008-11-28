require 'test_helper'

class TodoListsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:todo_lists)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create todo_list" do
    assert_difference('TodoList.count') do
      post :create, :todo_list => { }
    end

    assert_redirected_to todo_list_path(assigns(:todo_list))
  end

  test "should show todo_list" do
    get :show, :id => todo_lists(:one).id
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => todo_lists(:one).id
    assert_response :success
  end

  test "should update todo_list" do
    put :update, :id => todo_lists(:one).id, :todo_list => { }
    assert_redirected_to todo_list_path(assigns(:todo_list))
  end

  test "should destroy todo_list" do
    assert_difference('TodoList.count', -1) do
      delete :destroy, :id => todo_lists(:one).id
    end

    assert_redirected_to todo_lists_path
  end
end
