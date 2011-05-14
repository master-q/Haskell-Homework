StackとQueueを作ってみよう
==========================

StackとQueueの型クラスを作成してください
----------------------------------------

以下のようなStackとQueueの型クラスを作成してください。

    class Stack where
      empty :: xxxxx
      isEmpty:: xxxxx
      cons :: xxxxx
      head :: xxxxx
      tail :: xxxxx
    class Queue where
      empty :: xxxxx
      isEmpty :: xxxxx
      snoc :: xxxxx
      head :: xxxxx
      tail :: xxxxx

作成したStackとQueueクラスをテストしてください
----------------------------------------------

余力があれば、本ディレクトリに添付されている以下のテストコードを参考にして、
ユニットテストを実施してみてください。

* StackTest.hs : Stackのユニットテスト(errorで停止版)
* SafeStackTest.hs : Stackのユニットテスト(Maybe版)
* QueueTest.hs : Queueのユニットテスト(errorで停止版)
* SafeQueueTest.hs : Queueのユニットテスト(Maybe版)

上記ソースコードとは別の方法でテストを実施してもOKです。
