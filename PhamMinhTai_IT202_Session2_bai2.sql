-- =====================================================
-- [Vận dụng cơ bản 2]
-- Vá lỗ hổng "Khách hàng ảo"
-- =====================================================

-- =====================================================
-- PHÂN TÍCH LỖI
-- =====================================================

-- Lỗi 1:
-- Email chưa có NOT NULL
-- nên hệ thống cho phép lưu email rỗng hoặc NULL

-- Lỗi 2:
-- Age chưa có CHECK constraint
-- nên có thể nhập tuổi âm như -5


-- =====================================================
-- CẤU TRÚC BẢNG CŨ
-- =====================================================

CREATE TABLE Customers (

    CustomerID INT PRIMARY KEY,

    FullName VARCHAR(100),

    Email VARCHAR(100),

    Age INT

);


-- =====================================================
-- VÁ LỖI BẰNG ALTER TABLE
-- =====================================================

-- Thêm NOT NULL cho Email

ALTER TABLE Customers
MODIFY Email VARCHAR(100) NOT NULL;


-- Thêm CHECK cho Age

ALTER TABLE Customers
ADD CONSTRAINT chk_age
CHECK (Age >= 0);


-- =====================================================
-- KIỂM THỬ
-- =====================================================

-- Test 1:
-- Email NULL -> bị chặn

INSERT INTO Customers (
    CustomerID,
    FullName,
    Email,
    Age
)
VALUES (
    1,
    'Nguyen Van A',
    NULL,
    20
);


-- Test 2:
-- Tuổi âm -> bị chặn

INSERT INTO Customers (
    CustomerID,
    FullName,
    Email,
    Age
)
VALUES (
    2,
    'Tran Thi B',
    'b@gmail.com',
    -5
);


-- Test 3:
-- Dữ liệu hợp lệ -> thành công

INSERT INTO Customers (
    CustomerID,
    FullName,
    Email,
    Age
)
VALUES (
    3,
    'Le Van C',
    'c@gmail.com',
    22
);


-- =====================================================
-- XEM DỮ LIỆU
-- =====================================================

SELECT *
FROM Customers;