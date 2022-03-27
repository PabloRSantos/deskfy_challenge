CREATE DATABASE deskfy;

CREATE TABLE Users (
	id integer PRIMARY KEY,
    email text,
    name text
);

CREATE TABLE Groups  (
	id integer PRIMARY KEY,
    name text
);

CREATE TABLE User_groups (
	userId integer REFERENCES Users (id),
    groupId integer REFERENCES groups (id)
);

CREATE TABLE Folders (
	id integer PRIMARY KEY,
    name text,
    archived boolean,
    parentId int REFERENCES Folders(id)
);

CREATE TABLE Files (
	id integer PRIMARY KEY,
    name text,
  	folderId integer REFERENCES Folders(id)
);

CREATE TABLE Folder_groups (
	folderId integer REFERENCES Folders(id),
    groupId integer REFERENCES Groups(id)
);

CREATE TABLE File_groups (
	fileId integer REFERENCES Files(id),
    groupId integer REFERENCES Groups(id)
);