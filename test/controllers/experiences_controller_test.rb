require 'test_helper'

class ExperiencesControllerTest < ActionController::TestCase
  setup do
    @experience = experiences(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:experiences)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create experience" do
    assert_difference('Experience.count') do
      post :create, experience: { begin_date: @experience.begin_date, company: @experience.company, end_date: @experience.end_date, final_salary: @experience.final_salary, job_description: @experience.job_description, position: @experience.position, professional_area_id: @experience.professional_area_id, profile_id: @experience.profile_id, starting_salary: @experience.starting_salary }
    end

    assert_redirected_to experience_path(assigns(:experience))
  end

  test "should show experience" do
    get :show, id: @experience
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @experience
    assert_response :success
  end

  test "should update experience" do
    patch :update, id: @experience, experience: { begin_date: @experience.begin_date, company: @experience.company, end_date: @experience.end_date, final_salary: @experience.final_salary, job_description: @experience.job_description, position: @experience.position, professional_area_id: @experience.professional_area_id, profile_id: @experience.profile_id, starting_salary: @experience.starting_salary }
    assert_redirected_to experience_path(assigns(:experience))
  end

  test "should destroy experience" do
    assert_difference('Experience.count', -1) do
      delete :destroy, id: @experience
    end

    assert_redirected_to experiences_path
  end
end
