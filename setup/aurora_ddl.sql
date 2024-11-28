CREATE DATABASE IF NOT EXISTS example_db;

USE example_db;

CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,          -- ユーザーID（自動インクリメント）
    username VARCHAR(50) NOT NULL,             -- ユーザー名（ユニーク）
    email VARCHAR(100) NOT NULL,               -- メールアドレス（ユニーク）
    password_hash VARCHAR(255) NOT NULL,       -- パスワード（ハッシュ化されたものを想定）
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP, -- 作成日時
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP, -- 更新日時
    is_active BOOLEAN DEFAULT TRUE             -- アクティブフラグ
);

-- サンプルデータの挿入
INSERT INTO users (username, email, password_hash) VALUES
('john_doe', 'john.doe@example.com', 'hashed_password_123'),
('jane_smith', 'jane.smith@example.com', 'hashed_password_456');
