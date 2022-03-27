

with RECURSIVE tree_folders (id, name, parentid) as (
    SELECT folders.id, folders.name, folders.parentid, folders.archived FROM users
      LEFT JOIN user_groups ON user_groups.userid = users.id
      LEFT JOIN groups ON groups.id = user_groups.groupid
      LEFT JOIN file_groups ON file_groups.groupid = groups.id
      LEFT JOIN files ON files.id = file_groups.fileid 
  		OR files.id NOT IN (SELECT fileid FROM file_groups)
      LEFT JOIN folder_groups ON folder_groups.groupid = groups.id 
      INNER JOIN folders ON folders.id = folder_groups.folderid 
  		OR folders.id NOT IN (SELECT folderid FROM folder_groups)
  		OR files.folderid IN(folders.id)
      WHERE users.id = 1
    UNION
    	SELECT folders.id, folders.name, folders.parentid, folders.archived FROM folders
    	INNER JOIN tree_folders ON folders.parentid = tree_folders.id OR tree_folders.parentid = folders.id
  )
  
  SELECT tf.id, tf.name, tf.parentid FROM tree_folders as tf WHERE archived = false ORDER BY parentid DESC
  


  








