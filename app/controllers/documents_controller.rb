# @http_method XHR POST
# @url /documents
def create
  @document = current_user.documents.create(params[:document])
end