require 'test_helper'

class PoisControllerTest < ActionDispatch::IntegrationTest
  setup do
    @poi = pois(:one)
  end

  test "should get index" do
    get pois_url
    assert_response :success
  end

  test "should get new" do
    get new_poi_url
    assert_response :success
  end

  test "should create poi" do
    assert_difference('Poi.count') do
      post pois_url, params: { poi: { description: @poi.description, title: @poi.title } }
    end

    assert_redirected_to poi_url(Poi.last)
  end

  test "should show poi" do
    get poi_url(@poi)
    assert_response :success
  end

  test "should get edit" do
    get edit_poi_url(@poi)
    assert_response :success
  end

  test "should update poi" do
    patch poi_url(@poi), params: { poi: { description: @poi.description, title: @poi.title } }
    assert_redirected_to poi_url(@poi)
  end

  test "should destroy poi" do
    assert_difference('Poi.count', -1) do
      delete poi_url(@poi)
    end

    assert_redirected_to pois_url
  end
end
