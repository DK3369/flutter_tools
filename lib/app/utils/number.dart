class Num {
  /**
   * 四舍五入类型的精度
   * 保留两位小数 1变为1.00  1.567变为1.57
   * */
  String formatTwoNum(value) {
    return value.toStringAsFixed(2);
  }

  /**
   * 以 postion = 2
   * 保留两位小数 19.3成为19.30
   * 1.567 变为 1.56
   * */
  String formatNum(double num, int postion) {
    if ((num.toString().length - num.toString().lastIndexOf(".") - 1) < postion) {
      return num.toStringAsFixed(postion)
          .substring(0, num.toString().lastIndexOf(".") + postion + 1)
          .toString();
    } else {
      return num.toString().substring(0, num.toString().lastIndexOf(".") + postion + 1).toString();
    }
  }
}
