import common from '@ohos.app.ability.common';

// 获取UIAbilityContext
let context = getContext(this) as common.UIAbilityContext

@Entry
@Component
struct Index {
  @State message: string = 'HarmonyOS第一课'

  build() {
    Row() {
      Column() {
        Text(this.message)
          .fontSize(25)
          .fontWeight(FontWeight.Bold)
        Button() {
          Text('Hello World')
            .fontSize(14)
            .fontWeight(FontWeight.Bold)
        }
        .type(ButtonType.Capsule)
        .margin({
          top: 20
        })
        .backgroundColor('#0D9FFB')
        .width('40%')
        .height('5%')
        .onClick(() => {
          try {
            var want = {
              "deviceId": "", // deviceId为空表示本设备
              "bundleName": "com.example.firstcourse",
              "abilityName": "HelloWorldAbility",
              "moduleName": "HelloWorld" // moduleName非必选
            }
            context.startAbility(want, (err) => {
              // 处理业务逻辑错误
              if (err.code) {
                // 处理业务逻辑错误
                console.error(`startAbility failed, code is ${err.code}, message is ${err.message}`);
                return;
              }
              // 执行正常业务
              console.info('startAbility succeed');
            })
          } catch (err) {
            // 处理入参错误异常
            let code = err.code;
            let message = err.message;
            console.error(`startAbility failed, code is ${code}, message is ${message}`);
          }
        })
      }
      .width('100%')
    }
    .height('100%')
  }
}