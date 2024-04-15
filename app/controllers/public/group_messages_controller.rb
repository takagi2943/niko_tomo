class GroupMessagesController < ApplicationController
  before_action :set_group
  
  # メッセージを作成するアクション
  def create
    @message = @group.messages.build(message_params)
    @message.user = current_user
    if @message.save
      redirect_to group_messages_path(@group), notice: 'メッセージを送信しました。'
    else
      # 作成に失敗した場合、エラーメッセージを表示して再度メッセージ一覧を表示
      @messages = @group.messages
      render 'groups/show'
    end
  end
  
  private
  
  # グループをセットするためのメソッド
  def set_group
    @group = Group.find(params[:group_id])
  end
  
  # メッセージのパラメータを許可するためのストロングパラメータ
  def message_params
    params.require(:message).permit(:content)
  end
end
