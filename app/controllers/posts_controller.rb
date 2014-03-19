class PostsController < ApplicationController
  before_action :set_instance_variables, only: [:show, :edit]

  def show
  end

  def new
    @post = Post.new
    @project = Project.find(params[:project_id])
    @phase = Phase.find(params[:phase_id])
  end

  def edit
  end

  def create
    @post = Post.new(post_params)

    respond_to do |format|
      if @post.save
        format.html { redirect_to project_path(@post.project_id, phase_id: @post.phase_id), notice: 'Post was successfully created.' }
        format.json { render action: 'show', status: :created, location: @post }
      else
        format.html { render action: 'new' }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @post = Post.find(params[:id])
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to project_post_path(@post.project_id, @post, phase_id: @post.phase_id), notice: 'Post was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_instance_variables
      @post = Post.find(params[:id])
      @project = Project.find(params[:project_id])
      @phase = Phase.find(params[:phase_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:title, :message, :attachment, :phase_id, :project_id, :user_id)
    end
end
