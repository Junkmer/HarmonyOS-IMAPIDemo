import { V2TIMLogLevel, V2TIMSDKConfig } from '@tencentcloud/imsdk/src/main/ets/V2TIMCommon';
import { V2TIMManager} from '@tencentcloud/imsdk/src/main/ets/V2TIMManager';
import { genTestUserSig, SDKAPPID } from '../tools/GenerateTestUserSig';

@Entry
@Component
struct Index {
  @State message: string = 'Hello World';

  build() {
    RelativeContainer() {
      Text(this.message)
        .id('HelloWorld')
        .fontSize(50)
        .fontWeight(FontWeight.Bold)
        .alignRules({
          center: { anchor: '__container__', align: VerticalAlign.Center },
          middle: { anchor: '__container__', align: HorizontalAlign.Center }
        })
        .onClick(() =>{
          const  sdkConfig: V2TIMSDKConfig = {logLevel: 1}
          V2TIMManager.getInstance().initSDK(SDKAPPID, sdkConfig)
          let userID: string = "aaa"
          let userSig: string = genTestUserSig(userID)
          V2TIMManager.getInstance().login(userID,userSig)
        })
    }
    .height('100%')
    .width('100%')
  }
}