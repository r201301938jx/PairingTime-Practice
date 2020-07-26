class PostCommentsController < ApplicationController
  
  def create
    pairing = Pairing.find(params[:pairing_id])
    comment = current_user.post_comments.new(post_comment_params)
    comment.pairing_id = pairing.id
    comment.save
    redirect_to pairing_path(pairing)
  end
  
  def destroy
    PostComment.find_by(id: params[:id], pairing_id: params[:pairing_id]).destroy
    redirect_to pairing_path(params[:pairing_id])
  end
  
  private
  
  def post_comment_params
    params.require(:post_comment).permit(:comment)
  end

end
