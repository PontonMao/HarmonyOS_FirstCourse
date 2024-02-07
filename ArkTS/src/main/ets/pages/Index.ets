@Entry
@Component
struct Index {
  @State message: string = 'ArkTS开发语言介绍'

  build() {
    Row() {
      Column() {
        Text(this.message)
          .fontSize(25)
          .fontWeight(FontWeight.Bold)
      }
      .width('100%')
    }
    .height('100%')
  }
}