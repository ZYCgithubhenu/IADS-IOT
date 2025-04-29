import { http } from '@kit.NetworkKit';

export class HttpUtils {
  httpRequest: http.HttpRequest;

  constructor() {
    this.httpRequest = http.createHttp();
  }
}