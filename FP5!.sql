USE pandemic;

-- Крок 1: Видалити функцію, якщо вона вже існує
DROP FUNCTION IF EXISTS diff_years;

-- Крок 2: Створити функцію для обчислення різниці в роках
DELIMITER //

CREATE FUNCTION diff_years(num INT)
RETURNS INT
DETERMINISTIC
NO SQL
BEGIN
   -- Обчислюємо різницю в роках між датою 1 січня року (num) і поточною датою
   RETURN TIMESTAMPDIFF(YEAR, MAKEDATE(num, 1), CURDATE());
END //

DELIMITER ;

-- Крок 3: Перевіряємо функцію, вибираючи рік і обчислену різницю в роках
SELECT Year, diff_years(Year) AS diff_years
FROM infectious_cases_norm;

-- Крок 4: Додаємо нову колонку для збереження обчислених значень різниці в роках
ALTER TABLE infectious_cases_norm
ADD COLUMN diff_years2 INT;

-- Крок 5: Оновлюємо нову колонку, використовуючи створену функцію
UPDATE infectious_cases_norm
SET diff_years2 = diff_years(Year);

-- Крок 6: Отримуємо результати для перевірки
SELECT Year, diff_years2
FROM infectious_cases_norm;
