require 'test_helper'

class ProductSalesControllerTest < ActionController::TestCase
  setup do
    @product_sale = product_sales(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:product_sales)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create product_sale" do
    assert_difference('ProductSale.count') do
      post :create, product_sale: { cantidad: @product_sale.cantidad }
    end

    assert_redirected_to product_sale_path(assigns(:product_sale))
  end

  test "should show product_sale" do
    get :show, id: @product_sale
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @product_sale
    assert_response :success
  end

  test "should update product_sale" do
    patch :update, id: @product_sale, product_sale: { cantidad: @product_sale.cantidad }
    assert_redirected_to product_sale_path(assigns(:product_sale))
  end

  test "should destroy product_sale" do
    assert_difference('ProductSale.count', -1) do
      delete :destroy, id: @product_sale
    end

    assert_redirected_to product_sales_path
  end
end
