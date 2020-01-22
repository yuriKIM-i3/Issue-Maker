INSERT INTO user (username, password, name, isAccountNonExpired, isAccountNonLocked, isCredentialsNonExpired, isEnabled)
VALUES ('user1', 'password', 'smallName1', 1, 1, 1, 1);

INSERT INTO issue(id, title, content, user_id, viewcount, status)
VALUES (1, 'title1', 'smallName1', 2, 30, 1);
INSERT INTO issue(id, title, content, user_id, viewcount, status)
VALUES (2, 'title2', 'smallName2', 2, 30, 0);
INSERT INTO issue(id, title, content, user_id, viewcount, status)
VALUES (3, 'title3', 'smallName3', 2, 30, 1);
INSERT INTO issue(id, title, content, user_id, viewcount, status)
VALUES (4, 'title4', 'smallName4', 2, 30, 1);

INSERT INTO assignee(user_id, username, issue_id)
VALUES (2, "안보여", 1);
INSERT INTO assignee(user_id, username, issue_id)
VALUES (3, "안보여1", 1);
INSERT INTO assignee(user_id, username, issue_id)
VALUES (4, "안보여2", 1);