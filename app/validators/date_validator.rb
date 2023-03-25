# DateValidator は日付のフォーマットと日付の妥当性を検証するカスタムバリデーター
# 入力された値がyyyy-mm-dd形式でなければ errors.messages.invalid_date_format のエラーを返す。
# 入力された値が日付として妥当でない（2023年3月32日とか）の場合は errors.messages.invalid_date のエラーを返す。
# modelにて、`validates カラム名 date: true`と記述する
class DateValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    # 日付フォーマットのチェック
    unless /\A\d{1,4}\-\d{1,2}\-\d{1,2}\Z/ =~ value.to_s
      record.errors[attribute] << I18n.t('errors.messages.invalid_date_format')
    end

    # 日付の妥当性チェック
    begin
      (y, m, d) = value.split('-')
      Time.local(y, m, d, 0, 0, 0)
    rescue
      record.errors[attribute] << I18n.t('errors.messages.invalid_date')
    end
  end
end
