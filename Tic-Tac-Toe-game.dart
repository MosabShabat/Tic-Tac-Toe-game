
import 'dart:io';  // استيراد مكتبة لإدخال البيانات من المستخدم عبر وحدة التحكم

class TicTacToe {  // تعريف الفئة الأساسية للعبة Tic-Tac-Toe
  List<List<String>> board = List.generate(3, (_) => List.filled(3, ' '));
  // إنشاء مصفوفة 3×3 تمثل لوحة اللعب، حيث يتم ملء كل عنصر بمسافة فارغة (' ')

  String currentPlayer = 'X';  // تحديد اللاعب الحالي، يبدأ بـ 'X'

  void printBoard() {  // دالة لطباعة اللوحة على الشاشة
    for (var row in board) {  // تكرار لكل صف في اللوحة
      print(row.join(' | '));  // طباعة الصف مع فواصل بين العناصر
      print('-' * 9);  // إضافة خط فاصل لتحسين مظهر اللوحة
}
}

  bool makeMove(int row, int col) {  // دالة لتنفيذ حركة اللاعب
    if (board[row][col] == ' ') {  // التحقق من أن الموقع فارغ
      board[row][col] = currentPlayer;  // وضع رمز اللاعب في الموقع المحدد
      return true;  // إرجاع قيمة صحيحة للدلالة على نجاح الحركة
}
    return false;  // إرجاع قيمة خاطئة إذا كانت الخانة مشغولة
}

  bool checkWinner() {  // دالة للتحقق من الفائز
    for (int i = 0; i < 3; i++) {  // التكرار للتحقق من الصفوف والأعمدة
      if (board[i][0] == currentPlayer &&
          board[i][1] == currentPlayer &&
          board[i][2] == currentPlayer) return true;  // التحقق من فوز أحد الصفوف

      if (board[0][i] == currentPlayer &&
          board[1][i] == currentPlayer &&
          board[2][i] == currentPlayer) return true;  // التحقق من فوز أحد الأعمدة
}
    return (board[0][0] == currentPlayer &&
        board[1][1] == currentPlayer &&
        board[2][2] == currentPlayer) ||
        (board[0][2] == currentPlayer &&
        board[1][1] == currentPlayer &&
        board[2][0] == currentPlayer);
    // التحقق من فوز أحد الأقطار
}

  void play() {  // دالة تشغيل اللعبة
    while (true) {  // حلقة تكرارية لتشغيل اللعبة حتى الفوز أو التعادل
      printBoard();  // طباعة اللوحة في كل دورة
      print('Player $currentPlayer, enter row and column (0-2): ');  // مطالبة اللاعب بإدخال الحركة
      int row = int.parse(stdin.readLineSync()!);  // قراءة الصف الذي أدخله اللاعب
      int col = int.parse(stdin.readLineSync()!);  // قراءة العمود الذي أدخله اللاعب

      if (makeMove(row, col)) {  // تنفيذ الحركة إذا كانت صالحة
        if (checkWinner()) {  // التحقق مما إذا كان هناك فائز
          printBoard();  // طباعة اللوحة النهائية
          print('Player $currentPlayer wins!');  // الإعلان عن الفائز
          break;  // إنهاء اللعبة
}
        currentPlayer = (currentPlayer == 'X')? 'O': 'X';  // تبديل الدور بين اللاعبين
} else {
        print('Invalid move, try again.');  // طباعة رسالة خطأ في حالة إدخال حركة غير صالحة
}
}
}
}

void main() {  // نقطة البداية في البرنامج
  TicTacToe game = TicTacToe();  // إنشاء كائن من فئة TicTacToe
  game.play();  // بدء تشغيل اللعبة
}
