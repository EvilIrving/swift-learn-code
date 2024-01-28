/*
 結構化的 Concurrency & Task 的取消
  這個影片會先介紹 Swift 中的「Concurrency」是什麼意思；接著介紹結構化和非結構化的 Concurrency 差異；其中會包含 Task 的取消：什麼時候會有自動的取消、要如何手動取消以及如何明確加入取消判斷。
  ✨ 重點片段
  ------------ 簡報
  00:00 影片介紹
  00:15 提高程式效率的方法：平行執行
  01:00 提高程式效率的方法：非同步執行
  02:00 Swift 中的 Concurrency
  03:15 Task 的優先度、取消
  05:00 Structured Concurrency（結構化的）
  06:38 Unstructured Concurrency（非結構化的）
  07:50 結構化和非結構化的比較
  ------------ Xcode
  08:56 檔案架構介紹
  09:58 結構化和非結構化的煮飯寫法
  12:30 手動取消 Task
  13:33 callback 寫法
  16:28 讀取 Task 的回傳值
  21:43 TaskGroup 的 rethrows & waitForAll
  25:03 Task 的取消
  ------------ 其他
 
 作業連結➤ https://tinyurl.com/swift219
 
 
 檢查你是否學會了⋯⋯
     Concurrency 是什麼
     結構化 & 非結構化 Concurrency 的特性
     Task 的取消應用
 概念：
     Swift 中的 Concurrency 包含哪些提升效率的方法？
     哪些 async 語法能提供結構化的 Concurrency？
     非結構化 Concurrency 的優點和缺點是什麼？
     明確寫出和自動產生的檢查取消點是哪些？

 */
