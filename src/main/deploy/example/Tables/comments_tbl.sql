CREATE TABLE example.comments (
	cmt_id				UUID		NOT NULL
,	cmt_created			TIMESTAMP	NOT NULL
,	cmt_updated_ts		TIMESTAMP
,	cmt_comment			TEXT		NOT NULL
,	usr_id				UUID		NOT NULL
);
