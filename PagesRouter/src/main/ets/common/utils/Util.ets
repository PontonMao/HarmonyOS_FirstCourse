import common from '@ohos.app.ability.common'
import Want from '@ohos.app.ability.Want'
import Logger from './Logger'

const TAG = '[Util_StartMode]'

export function startMode(wantParameters: any, abilityName: any) {
  Logger.info(TAG, `${abilityName} start`)
  // context为调用方UIAbility的UIAbilityContext
  let context = getContext(this) as common.UIAbilityContext
  let want: Want = {
      deviceId: '', // deviceId为空表示本设备
    bundleName: 'com.example.firstcourse',
    abilityName: abilityName,
    moduleName: 'PagesRouter', // moduleName非必选
    parameters: wantParameters, // 自定义信息
  }
  context.startAbility(want).then(() => {
    Logger.info(TAG, 'Succeeded in starting ability.');
  }).catch((err: Error) => {
    Logger.info(TAG, `Failed to start ability. err is ` + JSON.stringify(err))
  })
  Logger.info(TAG, `${abilityName} end`)
}

export function startAbilityMode(targetAbilityName: string, wantParameters: any) {
  Logger.debug(TAG, `${targetAbilityName} start`)
  let context = getContext(this) as common.UIAbilityContext // 获取当前运行UIAbility上下文
  if (context != null) {
    let want: Want = {
      deviceId: '', // deviceId为空表示本设备
      bundleName: 'com.example.firstcourse',
      abilityName: targetAbilityName,
      moduleName: 'PagesRouter', // moduleName非必选
      parameters: wantParameters, // 自定义信息
    }
    try {
      context.startAbility(want).then(() => {
        Logger.debug(TAG, "startAbility success,targetAbilityName=${targetAbilityName}")
      })
    } catch (err) {
      Logger.debug(TAG, "startAbility failed,because err=" + JSON.stringify(err))
    } finally {
      Logger.debug(TAG, "startAbility finally block")
    }
  }
  Logger.debug(TAG, `${targetAbilityName} end`)
}

export function getContextData(): Want {
  let context = getContext() as common.UIAbilityContext
  if (context != null) {
    let data = {
      want: null
    }
    // 实现UIAbility组件与UI之间的数据同步
    //
    // EventHub：基于发布订阅模式来实现，事件需要先订阅后发布，订阅者收到消息后进行处理。
    // 在使用EventHub之前，首先需要获取EventHub对象。基类Context 提供了EventHub对象
    //
    // 通过event通讯获取UIAbility的数据
    context.eventHub.emit("getAbilityData", data)
    return data.want
  }
  return null
}