-- 워크벤치가 아닌 이곳에 적는다
DROP TABLE IF EXISTS user;
CREATE TABLE user (
    id INT PRIMARY KEY AUTO_INCREMENT,    
    username VARCHAR(255) NULL DEFAULT NULL,
    name VARCHAR(20) NULL DEFAULT NULL,
    password VARCHAR(500) NULL DEFAULT NULL,
    create_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	update_at DATETIME,
    isAccountNonExpired TINYINT(1) DEFAULT 1,
    isAccountNonLocked TINYINT(1) DEFAULT 1,
    isCredentialsNonExpired TINYINT(1) DEFAULT 1,
    isEnabled TINYINT(1) DEFAULT 1
);

DROP TABLE IF EXISTS authority;
CREATE TABLE authority (
    username VARCHAR(20) NULL DEFAULT NULL,
    authority_name VARCHAR(20) NULL DEFAULT NULL
); 

DROP TABLE IF EXISTS issue;
CREATE TABLE issue(
    id INT PRIMARY KEY AUTO_INCREMENT,
    title TEXT DEFAULT NULL,
    content TEXT DEFAULT NULL,
    status TINYINT(1) DEFAULT 1,
    viewcount INT,
    create_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	update_at DATETIME,
    user_id INT 
);

DROP TABLE IF EXISTS user_issue;
CREATE TABLE user_issue(
    user_id INT,
    issue_id INT
);

DROP TABLE IF EXISTS assignee;
CREATE TABLE assignee(
    id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT,
    username VARCHAR(20),
    issue_id INT
);