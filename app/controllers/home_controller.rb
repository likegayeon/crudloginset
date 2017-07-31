class HomeController < ApplicationController
  before_action :authenticate_user!
# 위 코드를 쓰면 Board 컨트롤러의 모든 액션에 로그인한 사람만 접근할 수 있도록
# 로그인을 하지 않았을 경우 로그인 페이지로 리다이렉트 되는 작업이 적용됩니다!

  def index
    @post = Post.all.reverse
  end
# reverse 메소드를 쓰면 작성순(제출순)대로 정렬되어있던 게시글들이
# 반대로 정렬되어 최신순이 맨 첫번째, 가장 처음 제출된 게시물이 맨 마지막으로 위치하도록 해줍니다!

  def create
    post = Post.new
    
    post.title = params[:title]
    post.content = params[:content]
    
    post.user_id = params[:user]
    post.save
    
    redirect_to "/"
  end
# @는 언제?? 뷰 파일에 보낼 때! (비둘기비둘기!)
# create 뷰 파일을 우리는 쓴다 안쓴다?? 안쓴다!! 
# @post의 골뱅이(@)를 떼버리고, 당신의 view파일에서 create를 과감히 날려버리세요!!!!

# Post를 만들기 위해서는 3가지 방법이 있죠! 이제는 한 가지 방법을 정할 때!
# 3가지 방법 중 위 방법이 예외 처리하기 좋으니 이 방법을 추천합니다! 다른 방법도 좋아요^ㅡ^


# 여러분 이 new는 새로운 글을 입력 받기 위한 new 뷰파일을 만들기 위해 
# (우리는 이전에 입력하는 new 뷰파일을 만들었지만 이 코드에서는 따로 new 뷰파일 없이 index에서 입력을 받았죠?  )
# 처음 명령어 'rails g controller home index create new' 때 만들어졌습니다!
# 저 명령어 한 줄이면 컨트롤러의 액션, 뷰파일, 라우트 설정(get)이 되므로 편하지만 이렇게 쓸모없는 액션도 만들어진다는 단점이 있습니다!!!
# 이 때는 과감히 삭제해버리면 되는데 new에 글을 수정하는 코드를 짠 아기사자들이 많았으므로 저는 그냥 주석처리 할게용~

#  def new
#  end
  
  def edit
    @edit_post = Post.find(params[:id])
  end
# edit은 게시물 수정을 할 때 원래 게시물에 저장되어 있는 것들을 '뷰 파일'-(/board/edit/:id 페이지)에서 보여주기 위한 거니까
# @를 이용해 뷰파일에 전달해야 하겠죠?
# 보통 수정 페이지(view)는 edit이라고 하고 수정하는 action은 update라고 합니다! 

  def update
    edit_post = Post.find(params[:id])
    edit_post.title = params[:title]
    edit_post.content = params[:content]
    edit_post.save
    
    redirect_to '/'
  end
# edit은 기능만 하고 view파일이 필요 없으니까 @가 없어도 됩니다!
# edit 뷰파일 필요 없으니까 삭제 삭제!

  def destroy
    destroy_post = Post.find(params[:id])
    destroy_post.destroy
    
    redirect_to "/"
  end
# destroy도 기능만 하고 view파일이 필요 없으니까 @가 없어도 됩니다!  
# destroy 뷰파일 필요 없으니까 삭제 삭제!

end
