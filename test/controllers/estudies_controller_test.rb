require 'test_helper'

class EstudiesControllerTest < ActionController::TestCase
  setup do
    @estudy = estudies(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:estudies)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create estudy" do
    assert_difference('Estudy.count') do
      post :create, estudy: { begin_year: @estudy.begin_year, education_level_id: @estudy.education_level_id, end_year: @estudy.end_year, finished: @estudy.finished, institution: @estudy.institution, professional_area_id: @estudy.professional_area_id, profile_id: @estudy.profile_id, title: @estudy.title }
    end

    assert_redirected_to estudy_path(assigns(:estudy))
  end

  test "should show estudy" do
    get :show, id: @estudy
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @estudy
    assert_response :success
  end

  test "should update estudy" do
    patch :update, id: @estudy, estudy: { begin_year: @estudy.begin_year, education_level_id: @estudy.education_level_id, end_year: @estudy.end_year, finished: @estudy.finished, institution: @estudy.institution, professional_area_id: @estudy.professional_area_id, profile_id: @estudy.profile_id, title: @estudy.title }
    assert_redirected_to estudy_path(assigns(:estudy))
  end

  test "should destroy estudy" do
    assert_difference('Estudy.count', -1) do
      delete :destroy, id: @estudy
    end

    assert_redirected_to estudies_path
  end
end
