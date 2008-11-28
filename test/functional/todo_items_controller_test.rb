require 'test_helper'

class TodoItemsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:todo_items)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create todo_item" do
    assert_difference('TodoItem.count') do
      post :create, :todo_item => { }
    end

    assert_redirected_to todo_item_path(assigns(:todo_item))
  end

  test "should show todo_item" do
    get :show, :id => todo_items(:one).id
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => todo_items(:one).id
    assert_response :success
  end

  test "should update todo_item" do
    put :update, :id => todo_items(:one).id, :todo_item => { }
    assert_redirected_to todo_item_path(assigns(:todo_item))
  end

  test "should destroy todo_item" do
    assert_difference('TodoItem.count', -1) do
      delete :destroy, :id => todo_items(:one).id
    end

    assert_redirected_to todo_items_path
  end
end
