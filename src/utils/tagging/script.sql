CREATE TABLE IF NOT EXISTS USERS (
mac TEXT PRIMARY KEY,
name TEXT,
addDate DATE,
lastSync DATE,
device TEXT
);

CREATE TABLE IF NOT EXISTS APPS (
app TEXT,
uri TEXT,
version TEXT,
addDate DATE,
comment TEXT,
PRIMARY KEY(app, uri)
);

CREATE TABLE IF NOT EXISTS TAGS (
tag TEXT PRIMARY KEY,
color TEXT,
addDate DATE,
comment TEXT
);

CREATE TABLE IF NOT EXISTS TAGS_USERS (
tag TEXT,
mac TEXT,
PRIMARY KEY(tag, mac),
FOREIGN KEY(tag) REFERENCES TAGS(tag),
FOREIGN KEY(mac) REFERENCES USERS(mac)
);

CREATE TABLE IF NOT EXISTS TAGS_URLS (
url TEXT,
tag TEXT,
title TEXT,
comment TEXT,
mime TEXT,
addDate DATE,
PRIMARY KEY(url, tag),
FOREIGN KEY(tag) REFERENCES TAGS(tag)
);

CREATE TABLE IF NOT EXISTS APPS_USERS (
mac TEXT,
app TEXT,
uri TEXT,
addDate DATE,
PRIMARY KEY(mac, app, uri),
FOREIGN KEY(mac) REFERENCES USERS(mac),
FOREIGN KEY(app) REFERENCES APPS(app),
FOREIGN KEY(uri) REFERENCES APPS(uri)
);

CREATE TABLE IF NOT EXISTS ABSTRACT (
app TEXT,
uri TEXT,
key TEXT,
lot TEXT,
addDate DATE,
comment TEXT,
PRIMARY KEY(app, key, lot),
FOREIGN KEY(app) REFERENCES APPS(app),
FOREIGN KEY(uri) REFERENCES APPS(uri)
);

CREATE TABLE IF NOT EXISTS TAGS_ABSTRACT (
app TEXT,
uri TEXT,
tag TEXT,
key TEXT,
lot TEXT,
comment TEXT,
addDate DATE,
PRIMARY KEY(app, uri, tag, key, lot),
FOREIGN KEY(app) REFERENCES APPS(app),
FOREIGN KEY(uri) REFERENCES APPS(uri),
FOREIGN KEY(key) REFERENCES ABSTRACT(key),
FOREIGN KEY(lot) REFERENCES ABSTRACT(lot),
FOREIGN KEY(tag) REFERENCES TAGS(tag)
);

COMMIT;
