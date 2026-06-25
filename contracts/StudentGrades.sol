// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.2 <0.9.0;

/**
 * @title StudentGrades
 * @dev Система оцінювання студентів
 */
contract StudentGrades {

    enum GradeStatus { Fail, Pass, Excellent }

    event LogCount(string label, uint count);
    event LogMessage(string msg);

    constructor() {
        // 3. Масив оцінок (uint8 — найменший тип для 0..100)
        uint8[] memory grades = new uint8[](6);

        // 4. Додавання оцінок з перевіркою
        uint8[6] memory raw = [uint8(55), 70, 95, 40, 85, 92];
        for (uint i = 0; i < raw.length; ) {
            require(raw[i] <= 100, "Grade > 100");
            grades[i] = raw[i];
            unchecked { i++; }
        }

        // 5. Аналіз оцінок
        uint failCount      = 0;
        uint passCount      = 0;
        uint excellentCount = 0;
        uint sum            = 0;

        for (uint i = 0; i < grades.length; ) {
            sum += grades[i];
            if (grades[i] < 60) {
                failCount++;
            } else if (grades[i] <= 89) {
                passCount++;
            } else {
                excellentCount++;
            }
            unchecked { i++; }
        }

        // 6. Вивід кількостей
        emit LogCount("Fail (<60)",        failCount);
        emit LogCount("Pass (60-89)",      passCount);
        emit LogCount("Excellent (90-100)", excellentCount);

        // 7. Середня оцінка та результат
        uint avg = sum / grades.length;
        string memory result = avg >= 60 ? "Good" : "Bad";
        emit LogMessage(result);
    }
}
