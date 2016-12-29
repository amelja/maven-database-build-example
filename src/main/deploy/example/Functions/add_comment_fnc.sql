CREATE OR REPLACE FUNCTION example.add_comment_fnc	(
								IN	p_created			TIMESTAMP
							,	IN	p_comment			TEXT
							,	IN	p_user_id			UUID
							) RETURNS UUID LANGUAGE plpgsql AS $$

/*
* Add user comment to Comments table 
*
* @Param p_created 		TIMESTAMP 	Date/Time the comment was created
* @Param p_comment 		TEXT 		Users comment
* @Param p_user_id		UUID		The users unique ID
*
* @Returns cmt_id 		UUID		The comments unique ID
*
* Version 	| Date 			| Author 	| Notes
* 1.0		| 28/12/2016	| R Thake	| Initial Version
*
*/

DECLARE

	l_return	UUID = NULL;

	l_function	TEXT = 'example.add_comment_fnc';

BEGIN
	BEGIN

		INSERT INTO example.comments	(	
								cmt_id
							,	cmt_created
							,	cmt_comment
							,	cmt_user_id
							) 
		VALUES	(	
				uuid_generate_v4()
			,	p_created
			,	p_comment
			,	p_user_id
			)
		RETURNING cmt_id INTO l_return;

	EXCEPTION
		WHEN OTHERS THEN
			l_return = NULL;
			RAISE EXCEPTION 'Error adding comment for user %', p_user_id;
	END;

RETURN l_return;

END$$;
/