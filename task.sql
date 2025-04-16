USE ShopDB;

-- Добавляем заказ вне транзакции
INSERT INTO Orders (CustomerID, Date)
VALUES (1, '2023-01-01');

-- Сохраняем ID созданного заказа
SET @order_id = LAST_INSERT_ID();

-- Начинаем транзакцию
START TRANSACTION;

-- Уменьшаем количество товара на складе
UPDATE Products
SET WarehouseAmount = WarehouseAmount - 1
WHERE ID = 1;

-- Добавляем товар в заказ
INSERT INTO OrderItems (OrderID, ProductID, Count)
VALUES (@order_id, 1, 1);

-- Завершаем транзакцию
COMMIT;
