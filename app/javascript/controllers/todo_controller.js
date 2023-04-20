import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  submit() {
    // セットされているTimeoutをクリアする
    clearTimeout(this.timeout);

    // Timeoutをセットする。200ms後にリクエストを実行する
    // debounceを実装というらしい
    this.timeout = setTimeout(() => {
      this.element.requestSubmit();
    }, 500);
  }
}
