require 'test_helper'

class ProductMaterialsControllerTest < ActionController::TestCase
  setup do
    @product_material = product_materials(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:product_materials)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create product_material" do
    assert_difference('ProductMaterial.count') do
      post :create, product_material: { units: @product_material.units }
    end

    assert_redirected_to product_material_path(assigns(:product_material))
  end

  test "should show product_material" do
    get :show, id: @product_material
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @product_material
    assert_response :success
  end

  test "should update product_material" do
    patch :update, id: @product_material, product_material: { units: @product_material.units }
    assert_redirected_to product_material_path(assigns(:product_material))
  end

  test "should destroy product_material" do
    assert_difference('ProductMaterial.count', -1) do
      delete :destroy, id: @product_material
    end

    assert_redirected_to product_materials_path
  end
end
