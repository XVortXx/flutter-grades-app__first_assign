import 'package:flutter/material.dart';

void main() {
  runApp(const StudentsGradeApp());
}

class Student {
  final String name;
  int grade;

  Student({required this.name, required this.grade});
}

class StudentsGradeApp extends StatelessWidget {
  const StudentsGradeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Students Grades',
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFFFBF8FD),
        fontFamily: 'Roboto',
      ),
      home: const GradesScreen(),
    );
  }
}

class GradesScreen extends StatefulWidget {
  const GradesScreen({super.key});

  @override
  State<GradesScreen> createState() => _GradesScreenState();
}

class _GradesScreenState extends State<GradesScreen> {
  // רשימת התלמידים והציונים הראשוניים כפי שמופיעים בצילום המסך
  final List<Student> _students = [
    Student(name: 'דניאל', grade: 92),
    Student(name: 'נועם', grade: 71),
    Student(name: 'אדיר', grade: 54),
    Student(name: 'ליאור', grade: 48),
  ];

  // חישוב ממוצע הציונים הדינמי
  double get _averageGrade {
    if (_students.isEmpty) return 0.0;
    int sum = _students.fold(0, (prev, s) => prev + s.grade);
    return sum / _students.length;
  }

  void _updateGrade(int index, int delta) {
    setState(() {
      int newGrade = _students[index].grade + delta;
      // הגבלת הציון בין 0 ל-100
      if (newGrade >= 0 && newGrade <= 100) {
        _students[index].grade = newGrade;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20.0,
              vertical: 12.0,
            ),
            child: Column(
              children: [
                // שורת כותרת עליונה: תפריט וממוצע
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // כפתור תפריט צד (כרגע לא עושה כלום)
                    Container(
                      width: 42,
                      height: 42,
                      decoration: const BoxDecoration(
                        color: Color(0xFFECE6F0),
                        shape: BoxShape.circle,
                      ),
                      child: IconButton(
                        icon: const Icon(
                          Icons.menu,
                          color: Color(0xFF49454F),
                          size: 22,
                        ),
                        onPressed: () {},
                      ),
                    ),
                    // תצוגת ממוצע הציונים
                    Text(
                      'ממוצע: ${_averageGrade.toStringAsFixed(1)}',
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF333333),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                // רשימת התלמידים
                Expanded(
                  child: ListView.separated(
                    itemCount: _students.length,
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: 12),
                    itemBuilder: (context, index) {
                      final student = _students[index];
                      final bool isPassing = student.grade >= 56;

                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4.0),
                        child: Row(
                          children: [
                            // כפתורי הוספה והורדה של ציון (מוצגים משמאל לפי RTL)
                            Row(
                              children: [
                                IconButton(
                                  icon: const Icon(
                                    Icons.add,
                                    size: 24,
                                    color: Color(0xFF49454F),
                                  ),
                                  onPressed: () => _updateGrade(index, 1),
                                ),
                                IconButton(
                                  icon: const Icon(
                                    Icons.remove,
                                    size: 24,
                                    color: Color(0xFF49454F),
                                  ),
                                  onPressed: () => _updateGrade(index, -1),
                                ),
                              ],
                            ),
                            const Spacer(),
                            // שם התלמיד והציון
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  student.name,
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xFF333333),
                                  ),
                                ),
                                const SizedBox(height: 2),
                                Text(
                                  'ציון: ${student.grade}',
                                  style: const TextStyle(
                                    fontSize: 13,
                                    color: Color(0xFF666666),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(width: 12),
                            // אייקון סטטוס (וי ירוק לעובר / איקס אדום לנכשל)
                            Icon(
                              isPassing ? Icons.check_circle : Icons.cancel,
                              color: isPassing
                                  ? const Color(0xFF4CAF50)
                                  : const Color(0xFFE53935),
                              size: 24,
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
