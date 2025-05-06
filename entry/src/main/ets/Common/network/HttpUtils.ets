import { http } from '@kit.NetworkKit';
import { fileIo, fileUri } from '@kit.CoreFileKit';
import { hilog } from '@kit.PerformanceAnalysisKit';
import ResponseData from '../../viewmodel/ResponseData/ResponseData';
import ListInfo from '../../viewmodel/ResponseData/ListInfo';

const TAG: string = 'ConnectionUtils';

export class HttpUtils {
  httpRequest: http.HttpRequest;

  constructor() {
    this.httpRequest = http.createHttp();
  }
  /**
   * The method of initiating a GET request through HTTP.
   */
  async getHttpRequest(cacheDir: string): Promise<string> {
    let responsePictureUri: string = '';
    await this.httpRequest.request('https://developer.huawei.com/system/modules/org.opencms.portal.template.core/' +
      'resources/harmony/img/jiantou_right.svg',
      { method: http.RequestMethod.GET }).then((data: http.HttpResponse) => {
      let filePath = cacheDir + '/test.svg';
      let file = fileIo.openSync(filePath, fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE);
      responsePictureUri = fileUri.getUriFromPath(filePath);
      fileIo.writeSync(file.fd, data.result as ArrayBuffer);
      fileIo.closeSync(file.fd);
    })
    return responsePictureUri;
  }
  /**
   * The method of initiating a POST request through HTTP.
   */
  async postHttpRequest(): Promise<ListInfo[]> {
    let responseData: Array<ListInfo> = [];
    await this.httpRequest.request('https://svc-drcn.developer.huawei.com/community/servlet/consumer' +
      '/partnerActivityService/v1/developer/activity/terminalActivities/list',
      {
        method: http.RequestMethod.POST, extraData: {
        'status': '1',
        'belong': '1',
        'language': 'cn',
        'needTop': 1,
        'displayChannel': [1, 3],
        'count': 4,
        'pagestart': 1,
        'type': '1,4,5,6'
      },
       // header: new Header('application/json;charset=UTF-8')
      }).then((data: http.HttpResponse) => {
      let result: ResponseData = JSON.parse(data.result as string);
      responseData = result.value.list;
    }).catch((err: Error) => {
      hilog.info(0x0000,TAG, JSON.stringify(err));
    });
    return responseData;
  }
  /**
   * The method of destroying httpRequest.
   */
  destroyHttpRequest() {
    this.httpRequest.destroy();
  }
}