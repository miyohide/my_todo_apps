# ApplicationHelper はすべての画面に共通なヘルパー関数
module ApplicationHelper
  def turbo_stream_flash
    turbo_stream.update "flash", partial: "flash"
  end
end
