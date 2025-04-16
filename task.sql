USE ShopDB;

-- Начинаем транзакцию
START TRANSACTION;

-- Создаём заказ
INSERT INTO Orders (CustomerID, Date)
VALUES (1, '2023-01-01');

-- Сохраняем ID созданного заказа
SET @order_id = LAST_INSERT_ID();

-- Уменьшаем количество товара на складе
UPDATE Products
SET WarehouseAmount = WarehouseAmount - 1
WHERE ID = 1;

-- Добавляем товар в заказ
INSERT INTO OrderItems (OrderID, ProductID, Count)
VALUES (@order_id, 1, 1);

-- Завершаем транзакцию
COMMIT;
