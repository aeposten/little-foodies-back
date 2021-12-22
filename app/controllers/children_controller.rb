class ChildrenController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
  rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response


  def index
    children = Child.all
    render json: children
  end

  def show
    child = find_child
    render json: child
  end

  def create
    child = current_user.children.create!(child_params)
    render json: child, status: :created
  end


  def destroy
    activity = find_child
    activity.destroy
    head :no_content
  end

  private

  def child_params
    params.permit(:first_name, :age, :img_url)
  end

  def find_child
    Child.find(params[:id])
  end

  def render_not_found_response
    render json: { error: "Child not found"}, status: :not_found
  end

  def render_unprocessable_entity_response(invalid)
    render json: { errors: invalid.record.errors.full_messages }, status: :unprocessable_entity
  end

end
