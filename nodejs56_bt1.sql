CREATE DATABASE nodejs56_bt1


CREATE TABLE `user` (
    `user_id` INT PRIMARY KEY AUTO_INCREMENT,
    `full_name` VARCHAR(255),
    `email` VARCHAR(255),
    `password` VARCHAR(255)
);

CREATE TABLE `restaurant` (
    `res_id` INT PRIMARY KEY AUTO_INCREMENT,
    `res_name` VARCHAR(255),
    `Image` VARCHAR(255),
    `desc` VARCHAR(255)
);

CREATE TABLE `food_type` (
    `type_id` INT PRIMARY KEY AUTO_INCREMENT,
    `type_name` VARCHAR(255)
);

CREATE TABLE `food` (
    `food_id` INT PRIMARY KEY AUTO_INCREMENT,
    `food_name` VARCHAR(255),
    `image` VARCHAR(255),
    `price` FLOAT,
    `desc` VARCHAR(255),
    `type_id` INT,
    FOREIGN KEY (`type_id`) REFERENCES `food_type`(`type_id`)
);

CREATE TABLE `sub_food` (
    `sub_id` INT PRIMARY KEY AUTO_INCREMENT,
    `sub_name` VARCHAR(255),
    `sub_price` FLOAT,
    `food_id` INT,
    FOREIGN KEY (`food_id`) REFERENCES `food`(`food_id`)
);

CREATE TABLE `order` (
	`id` INT PRIMARY KEY AUTO_INCREMENT,
    `user_id` INT,
    `food_id` INT,
    `amount` INT,
    `code` VARCHAR(255),
    `arr_sub_id` VARCHAR(255),
    FOREIGN KEY (`user_id`) REFERENCES `user`(`user_id`),
    FOREIGN KEY (`food_id`) REFERENCES `food`(`food_id`)
);

CREATE TABLE `rate_res` (
	`id` INT PRIMARY KEY AUTO_INCREMENT,
    `user_id` INT,
    `res_id` INT,
    `amount` INT,
    `date_rate` DATETIME,
    FOREIGN KEY (`user_id`) REFERENCES `user`(`user_id`),
    FOREIGN KEY (`res_id`) REFERENCES `restaurant`(`res_id`)
);

CREATE TABLE `like_res` (
	`id` INT PRIMARY KEY AUTO_INCREMENT,
    `user_id` INT,
    `res_id` INT,
    `date_like` DATETIME,
    FOREIGN KEY (`user_id`) REFERENCES `user`(`user_id`),
    FOREIGN KEY (`res_id`) REFERENCES `restaurant`(`res_id`)
);

INSERT INTO `user` (`full_name`, `email`, `password`) VALUES
('Nguyễn Văn An', 'nguyenvanaan@a.com', '123'),
('Trần Thị Bình', 'tranthibinh@a.com', '456'),
('Lê Minh Cường', 'leminhcuong@a.com', '789'),
('Phạm Thu Dung', 'phamthudung@a.com', '789'),
('Hoàng Quang Huy', 'hoangqunaghuy@a.com', '789'),
('Võ Thị Lan', 'vothil@a.com', '789'),
('Trần Văn Minh', 'tranvanminh@a.com', '789');

INSERT INTO `restaurant` (`res_name`, `Image`, `desc`) VALUES
('Nhà Hàng Phố Cổ', 'https://example.com/res1.jpg', 'Chuyên món ăn Bắc bộ truyền thống'),
('Burger & Grill Zone', 'https://example.com/res2.jpg', 'Thức ăn nhanh và món nướng kiểu Mỹ'),
('Sushi Paradise', 'https://example.com/res3.jpg', 'Ẩm thực Nhật Bản tươi ngon');


INSERT INTO `food_type` (`type_name`) VALUES
('Món chính'),
('Trà sữa'),
('Đồ ăn nhanh');

INSERT INTO `food` (`food_name`, `image`, `price`, `desc`, `type_id`) VALUES
('Phở Bò Đặc Biệt', 'https://example.com/pho.jpg', 65000, 'Phở bò tái nạm gầu thơm ngon', 1),
('Trà Sữa Olong', 'https://example.com/matcha.jpg', 30000, 'Trà ô long rang được ưa chuộng nhờ sự kết hợp giữa vị chát nhẹ, thanh mát và vị béo ngậy từ sữa', 2),
('Trà Sữa Matcha', 'https://example.com/matcha.jpg', 35000, 'Trà sữa vị trà xanh thanh mát', 2),
('Combo Cheeseburger', 'https://example.com/burger.jpg', 89000, 'Burger bò phô mai kèm khoai tây chiên', 3),
('Sashimi Cá Hồi', 'https://example.com/sashimi.jpg', 120000, '5 miếng cá hồi Na-uy tươi sống', 1);


INSERT INTO `sub_food` (`sub_name`, `sub_price`, `food_id`) VALUES
('Thêm Trứng Chần', 10000, 1),    
('Thêm Quẩy', 5000, 1),    
('Thêm Trân Châu Đen', 8000, 2),
('Thêm Phô Mai Lát', 12000, 3);  


INSERT INTO `order` (`user_id`, `food_id`, `amount`, `code`, `arr_sub_id`) VALUES
(1, 1, 2, 'ORD-20260808-01', '1,2'),
(1, 2, 1, 'ORD-20260808-02', '3'),
(2, 3, 1, 'ORD-20260808-03', '4'),
(3, 4, 3, 'ORD-20260808-04', NULL),
(4, 1, 1, 'ORD-20260808-05', '1'),
(5, 2, 2, 'ORD-20260808-06', '3'),
(6, 3, 2, 'ORD-20260808-07', '4'); 


INSERT INTO `rate_res` (`user_id`, `res_id`, `amount`, `date_rate`) VALUES
(1, 1, 5, '2026-08-01 10:30:00'),
(1, 2, 4, '2026-08-02 14:20:00'),
(2, 1, 4, '2026-08-03 11:15:00'),
(3, 3, 5, '2026-08-04 19:00:00'),
(4, 2, 3, '2026-08-05 12:45:00'),
(5, 3, 5, '2026-08-06 20:10:00'),
(6, 1, 5, '2026-08-07 18:30:00');


INSERT INTO `like_res` (`user_id`, `res_id`, `date_like`) VALUES
(1, 1, '2026-08-01 10:32:00'),
(1, 3, '2026-08-02 15:00:00'),
(2, 1, '2026-08-03 11:20:00'),
(3, 3, '2026-08-04 19:05:00'),
(4, 2, '2026-08-05 12:50:00'),
(5, 2, '2026-08-06 18:00:00'),
(5, 3, '2026-08-06 20:12:00'),
(6, 1, '2026-08-07 18:35:00');

---------------------------------------
--Tìm 5 người đã like nhà hàng nhiều nhất
SELECT u.`full_name`,u.`email`,u.`password`, COUNT(l.res_id) as total_like FROM `user` u
INNER JOIN `like_res` l ON l.`user_id` = u.`user_id`
GROUP BY u.`full_name`,u.`email`,u.`password`
ORDER BY total_like DESC
LIMIT 5

--Tìm 2 nhà hàng có lượt like nhiều nhất.
SELECT r.`res_id`, r.`res_name`, COUNT(l.user_id) as total_like FROM `restaurant` r
INNER JOIN `like_res` l ON l.`res_id` = r.`res_id`
GROUP BY r.`res_id`,r.`res_name`
ORDER BY total_like DESC
LIMIT 2

--Tìm người đã đặt hàng nhiều nhất.
SELECT u.`user_id`, u.`full_name`, u.`email`, COUNT(o.`id`) AS total_orders  FROM `user`u 
INNER JOIN `order` o ON o.`user_id` = u.`user_id`
GROUP BY u.`user_id`, u.`full_name`, u.`email`
ORDER BY total_orders DESC
LIMIT 1

--Tìm người dùng không hoạt động trong hệ thống (không đặt hàng, không like, không đánh giá nhà hàng).
SELECT u.`user_id`, u.`full_name`, u.`email` FROM `user` u 
LEFT JOIN `order` o ON u.`user_id` = o.`user_id`
LEFT JOIN `like_res` l ON u.`user_id` = l.`user_id`
LEFT JOIN `rate_res` r ON u.`user_id` = r.`user_id`
WHERE o.`user_id` IS NULL 
  AND l.`user_id` IS NULL 
  AND r.`user_id` IS NULL;


