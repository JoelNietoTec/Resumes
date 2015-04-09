require 'test_helper'

class ProfilesControllerTest < ActionController::TestCase
  setup do
    @profile = profiles(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:profiles)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create profile" do
    assert_difference('Profile.count') do
      post :create, profile: { address: @profile.address, birth_date: @profile.birth_date, country_id: @profile.country_id, district_id: @profile.district_id, email: @profile.email, forenames: @profile.forenames, marital_status_id: @profile.marital_status_id, nationality_id: @profile.nationality_id, phone_number: @profile.phone_number, presentation: @profile.presentation, professional_title: @profile.professional_title, province_id: @profile.province_id, sex_id: @profile.sex_id, skills: @profile.skills, surnames: @profile.surnames, township_id: @profile.township_id, user_id: @profile.user_id, wage_aspiration: @profile.wage_aspiration }
    end

    assert_redirected_to profile_path(assigns(:profile))
  end

  test "should show profile" do
    get :show, id: @profile
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @profile
    assert_response :success
  end

  test "should update profile" do
    patch :update, id: @profile, profile: { address: @profile.address, birth_date: @profile.birth_date, country_id: @profile.country_id, district_id: @profile.district_id, email: @profile.email, forenames: @profile.forenames, marital_status_id: @profile.marital_status_id, nationality_id: @profile.nationality_id, phone_number: @profile.phone_number, presentation: @profile.presentation, professional_title: @profile.professional_title, province_id: @profile.province_id, sex_id: @profile.sex_id, skills: @profile.skills, surnames: @profile.surnames, township_id: @profile.township_id, user_id: @profile.user_id, wage_aspiration: @profile.wage_aspiration }
    assert_redirected_to profile_path(assigns(:profile))
  end

  test "should destroy profile" do
    assert_difference('Profile.count', -1) do
      delete :destroy, id: @profile
    end

    assert_redirected_to profiles_path
  end
end
