ALTER TABLE ONLY example.comments
ADD CONSTRAINT fk_cmt_usr_id FOREIGN KEY (usr_id) REFERENCES example.users(ust_id);