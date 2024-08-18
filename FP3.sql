-- 3. Проаналізуйте дані:
-- Для кожної унікальної комбінації Entity та Code або їх id порахуйте середнє, мінімальне, максимальне значення та суму для атрибута Number_rabies.
-- 💡 Врахуйте, що атрибут Number_rabies може містити порожні значення ‘’ — вам попередньо необхідно їх відфільтрувати.
-- Результат відсортуйте за порахованим середнім значенням у порядку спадання.
-- Оберіть тільки 10 рядків для виведення на екран.

USE pandemic;

SELECT country_id,
       AVG(Number_rabies) AS average,
       MIN(Number_rabies) AS minimal,
       MAX(Number_rabies) AS maximal,
       SUM(Number_rabies) AS sum
FROM infectious_cases_norm
WHERE Number_rabies IS NOT NULL
  AND Number_rabies <> ''
GROUP BY country_id
ORDER BY average DESC
LIMIT 10;
