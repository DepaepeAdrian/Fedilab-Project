-- *********************************************
-- * SQL SQLite generation                     
-- *********************************************

-- Logical Database Schema enriched by implicit foreign keys
-- _____________ 


drop database IF EXISTS Fedilab;

create database IF NOT EXISTS Fedilab;

use Fedilab;

CREATE TABLE  IF NOT EXISTS USER_ACCOUNT (USER_ID VARCHAR(255) PRIMARY KEY NOT NULL,
USERNAME TEXT NOT NULL,
ACCT TEXT NOT NULL,
DISPLAYED_NAME TEXT NOT NULL,
LOCKED INTEGER NOT NULL,
FOLLOWERS_COUNT INTEGER NOT NULL,
FOLLOWING_COUNT INTEGER NOT NULL,
STATUSES_COUNT INTEGER NOT NULL,
NOTE TEXT NOT NULL,
URL TEXT NOT NULL,
AVATAR TEXT NOT NULL,
AVATAR_STATIC TEXT NOT NULL,
HEADER TEXT NOT NULL,
HEADER_STATIC TEXT NOT NULL,
EMOJIS TEXT,
SOCIAL TEXT,
IS_MODERATOR INTEGER DEFAULT 0,
IS_ADMIN INTEGER DEFAULT 0,
CLIENT_ID TEXT,
CLIENT_SECRET TEXT,
REFRESH_TOKEN TEXT,
UPDATED_AT TEXT,
PRIVACY TEXT,
SENSITIV INTEGER DEFAULT 0,
INSTANCE VARCHAR(255) NOT NULL,
OAUTH_TOKEN TEXT NOT NULL,
CREATED_AT TEXT NOT NULL);


CREATE TABLE  IF NOT EXISTS STATUSES_STORED (ID VARCHAR(255) PRIMARY KEY NOT NULL,
USER_ID VARCHAR(255) NOT NULL,
INSTANCE VARCHAR(255) NOT NULL,
STATUS_SERIALIZED TEXT NOT NULL,
STATUS_REPLY_SERIALIZED TEXT,
DATE_CREATION TEXT NOT NULL,
IS_SCHEDULED INTEGER NOT NULL,
DATE_SCHEDULED TEXT,
SENT INTEGER NOT NULL,
DATE_SENT TEXT);


CREATE TABLE  IF NOT EXISTS  CUSTOM_EMOJI (ID INTEGER PRIMARY KEY AUTO_INCREMENT,
DATE_CREATION TEXT NOT NULL,
INSTANCE VARCHAR(255) NOT NULL,
SHOERTCODE TEXT NOT NULL,
URL TEXT NOT NULL,
URL_STATIC TEXT NOT NULL);


CREATE TABLE  IF NOT EXISTS SEARCH (ID INTEGER PRIMARY KEY AUTO_INCREMENT,
KEYWORDS TEXT NOT NULL,
USER_ID VARCHAR(255) NOT NULL,
ANY_TAG TEXT NOT NULL,
ALL_TAG TEXT NOT NULL,
NONE_TAG TEXT NOT NULL,
NAME TEXT NOT NULL,
IS_ART TEXT NOT NULL,
IS_NSFW TEXT NOT NULL,
DATE_CREATION TEXT NOT NULL);


CREATE TABLE  IF NOT EXISTS TEMP_MUTE (ID INTEGER PRIMARY KEY AUTO_INCREMENT,
ACCT TEXT NOT NULL,
INSTANCE VARCHAR(255) NOT NULL,
TARGETED_USER_ID VARCHAR(255) NOT NULL,
DATE_CREATION TEXT NOT NULL,
DATE_END TEXT NOT NULL);


CREATE TABLE  IF NOT EXISTS STATUSES_CACHE (ID VARCHAR(255) PRIMARY KEY NOT NULL,
CACHED_ACTION INTEGER NOT NULL,
INSTANCE VARCHAR(255) NOT NULL,
USER_ID VARCHAR(255) NOT NULL,
DATE_BACKUP TEXT NOT NULL,
STATUS_ID VARCHAR(255) NOT NULL NOT NULL,
URI TEXT NOT NULL,
URL TEXT NOT NULL,
ACCOUNT TEXT NOT NULL,
IN_REPLY_TO_ID TEXT,
IN_REPLY_TO_ACCOUNT_ID TEXT,
REBLOG TEXT,
CONTENT TEXT NOT NULL,
CREATED_AT TEXT NOT NULL,
EMOJIS TEXT,
REBLOGS_COUNT INTEGER NOT NULL,
FAVOURITES_COUNT INTEGER NOT NULL,
REBLOGGED INTEGER,
FAVOURITED INTEGER,
MUTED INTEGER,
SENSITIV INTEGER,
SPOILER_TEXT TEXT,
VISIBILITY TEXT NOT NULL,
MEDIA_ATTACHMENTS TEXT,
CARD TEXT,
MENTIONS TEXT,
POLL TEXT,
TAGS TEXT,
APPLICATION TEXT,
LANGUAGE TEXT,
PINNED INTEGER);


CREATE TABLE  IF NOT EXISTS USER_ACCOUNT_TEMP (USER_ID VARCHAR(255) PRIMARY KEY NOT NULL,
USERNAME TEXT NOT NULL,
ACCT TEXT NOT NULL,
DISPLAYED_NAME TEXT NOT NULL,
LOCKED INTEGER NOT NULL,
FOLLOWERS_COUNT INTEGER NOT NULL,
FOLLOWING_COUNT INTEGER NOT NULL,
STATUSES_COUNT INTEGER NOT NULL,
NOTE TEXT NOT NULL,
URL TEXT NOT NULL,
AVATAR TEXT NOT NULL,
AVATAR_STATIC TEXT NOT NULL,
HEADER TEXT NOT NULL,
HEADER_STATIC TEXT NOT NULL,
EMOJIS TEXT,
SOCIAL TEXT,
IS_MODERATOR INTEGER DEFAULT 0,
IS_ADMIN INTEGER DEFAULT 0,
CLIENT_ID TEXT,
CLIENT_SECRET TEXT,
REFRESH_TOKEN TEXT,
UPDATED_AT TEXT,
PRIVACY TEXT,
SENSITIV INTEGER DEFAULT 0,
INSTANCE VARCHAR(255) NOT NULL,
OAUTH_TOKEN TEXT NOT NULL,
CREATED_AT TEXT NOT NULL);


CREATE TABLE  IF NOT EXISTS INSTANCES (ID VARCHAR(255) PRIMARY KEY  NOT NULL,
INSTANCE VARCHAR(255) NOT NULL,
USER_ID VARCHAR(255) NOT NULL,
INSTANCE_TYPE TEXT NOT NULL,
TAGS TEXT NOT NULL,
FILTERED_WITH TEXT NOT NULL,
DATE_CREATION TEXT NOT NULL);


CREATE TABLE  IF NOT EXISTS PEERTUBE_FAVOURITES (ID INTEGER PRIMARY KEY AUTO_INCREMENT,
UUID TEXT NOT NULL,
INSTANCE VARCHAR(255) NOT NULL,
CACHE TEXT NOT NULL,
DATE TEXT NOT NULL);


CREATE TABLE  IF NOT EXISTS CACHE_TAGS (ID INTEGER PRIMARY KEY AUTO_INCREMENT,
TAGS TEXT NOT NULL);


CREATE TABLE  IF NOT EXISTS BOOST_SCHEDULE (ID INTEGER PRIMARY KEY AUTO_INCREMENT,
USER_ID VARCHAR(255) NOT NULL,
INSTANCE VARCHAR(255) NOT NULL,
STATUS_SERIALIZED TEXT NOT NULL,
DATE_SCHEDULED TEXT,
IS_SCHEDULED INTEGER NOT NULL,
SENT INTEGER NOT NULL,
DATE_SENT TEXT);


CREATE TABLE  IF NOT EXISTS TRACKING_BLOCK (ID INTEGER PRIMARY KEY AUTO_INCREMENT,
DOMAIN TEXT NOT NULL);


CREATE TABLE  IF NOT EXISTS TIMELINES (ID INTEGER PRIMARY KEY AUTO_INCREMENT,
POSITION INTEGER NOT NULL,
USER_ID VARCHAR(255) NOT NULL,
INSTANCE VARCHAR(255) NOT NULL,
TYPE TEXT NOT NULL,
REMOTE_INSTANCE TEXT,
TAG_TIMELINE TEXT,
DISPLAYED INTEGER NOT NULL,
LIST_TIMELINE TEXT);

CREATE TABLE  IF NOT EXISTS TIMELINE_CACHE(ID INTEGER PRIMARY KEY AUTO_INCREMENT,
STATUS_ID VARCHAR(255) NOT NULL NOT NULL,
INSTANCE VARCHAR(255) NOT NULL,
USER_ID VARCHAR(255) NOT NULL,
CACHE TEXT NOT NULL,
DATE TEXT NOT NULL);

CREATE TABLE  IF NOT EXISTS NOTIFICATION_CACHE(ID INTEGER PRIMARY KEY AUTO_INCREMENT,
NOTIFICATION_ID TEXT NOT NULL,
INSTANCE VARCHAR(255) NOT NULL,
USER_ID VARCHAR(255) NOT NULL,
ACCOUNT TEXT NOT NULL,
TYPE TEXT NOT NULL,
STATUS_ID VARCHAR(255) NOT NULL,
IN_REPLY_TO_ID TEXT,
STATUS_ID_CACHE VARCHAR(255) NOT NULL,
CREATED_AT TEXT NOT NULL);


CREATE TABLE  IF NOT EXISTS MAIN_MENU_ITEMS(ID INTEGER PRIMARY KEY AUTO_INCREMENT,
USER_ID VARCHAR(255) NOT NULL,
INSTANCE VARCHAR(255) NOT NULL,
NAV_NEWS INTEGER DEFAULT 1,
NAV_LIST INTEGER DEFAULT 1,
NAV_SCHEDULED INTEGER DEFAULT 1,
NAV_ARCHIVE INTEGER DEFAULT 1,
NAV_ARCHIVE_NOTIFICATIONS INTEGER DEFAULT 1,
NAV_PEERTUBE INTEGER DEFAULT 1,
NAV_FILTERS INTEGER DEFAULT 1,
NAV_HOW_TO_FOLLOW INTEGER DEFAULT 1,
NAV_ADMINISTRATION INTEGER DEFAULT 1,
NAV_BLOCKED INTEGER DEFAULT 1,
NAV_MUTED INTEGER DEFAULT 1,
NAV_BLOCKED_DOMAINS INTEGER DEFAULT 1,
NAV_TRENDS INTEGER DEFAULT 1,
NAV_HOWTO INTEGER DEFAULT 1);


CREATE TABLE  IF NOT EXISTS USER_NOTES(ID INTEGER PRIMARY KEY AUTO_INCREMENT,
ACCT TEXT NOT NULL,
NOTE TEXT,
DATE_CREATION TEXT NOT NULL);


-- *********************************************
-- * IMPLICIT FKs found                    
-- *********************************************
 --status_by : STATUS_ID -> STATUSES_CACHE.ID
 --used_by : USER_ID -> USER_ACCOUNT.USER_ID


alter table NOTIFICATION_CACHE add constraint REF_INSTANCE_FK_NOTIFICATION_CACHE
     foreign key (INSTANCE) references INSTANCES (ID);
	 
alter table NOTIFICATION_CACHE add constraint REF_STATUSES_STORED_FK_NOTIFICATION_CACHE
     foreign key (STATUS_ID_CACHE) references STATUSES_STORED (ID);

alter table NOTIFICATION_CACHE add constraint REF_STATUSES_CACHE_FK_NOTIFICATION_CACHE
     foreign key (STATUS_ID) references STATUSES_CACHE (ID);
	 
alter table NOTIFICATION_CACHE add constraint REF_USER_ACCOUNT_FK_NOTIFICATION_CACHE
     foreign key (USER_ID) references USER_ACCOUNT (USER_ID);
------
	 
alter table TIMELINE_CACHE add constraint REF_INSTANCE_FK_TIMELINE_CACHE
     foreign key (INSTANCE) references INSTANCES (ID);
	 
alter table TIMELINE_CACHE add constraint REF_STATUSES_CACHE_FK_TIMELINE_CACHE
     foreign key (STATUS_ID) references STATUSES_CACHE (ID);
	 
alter table TIMELINE_CACHE add constraint REF_USER_ACCOUNT_FK_TIMELINE_CACHE
     foreign key (USER_ID) references USER_ACCOUNT (USER_ID);
	 
------

alter table INSTANCES add constraint REF_USER_ACCOUNT_FK_INSTANCES
     foreign key (USER_ID) references USER_ACCOUNT (USER_ID);
------

alter table PEERTUBE_FAVOURITES add constraint REF_INSTANCE_FK_PEERTUBE_FAVOURITES
     foreign key (INSTANCE) references INSTANCES (ID);
------

alter table MAIN_MENU_ITEMS add constraint REF_INSTANCE_FK_MAIN_MENU_ITEMS
     foreign key (INSTANCE) references INSTANCES (ID);
	 
alter table MAIN_MENU_ITEMS add constraint REF_USER_ACCOUNT_FK_MAIN_MENU_ITEMS
     foreign key (USER_ID) references USER_ACCOUNT (USER_ID);
------

alter table BOOST_SCHEDULE add constraint REF_INSTANCE_FK_BOOST_SCHEDULE
     foreign key (INSTANCE) references INSTANCES (ID);
	 
alter table BOOST_SCHEDULE add constraint REF_USER_ACCOUNT_FK_BOOST_SCHEDULE
     foreign key (USER_ID) references USER_ACCOUNT (USER_ID);
------

alter table TEMP_MUTE add constraint REF_INSTANCE_FK_TEMP_MUTE
     foreign key (INSTANCE) references INSTANCES (ID);

alter table TEMP_MUTE add constraint REF_USER_ACCOUNT_FK_TEMP_MUTE
     foreign key (TARGETED_USER_ID) references USER_ACCOUNT (USER_ID);

------

alter table CUSTOM_EMOJI add constraint REF_INSTANCE_FK_CUSTOM_EMOJI
     foreign key (INSTANCE) references INSTANCES (ID);
------

alter table STATUSES_CACHE add constraint REF_INSTANCE_FK_STATUSES_CACHE
     foreign key (INSTANCE) references INSTANCES (ID);
	 
alter table STATUSES_CACHE add constraint REF_STATUSES_CACHE_FK_STATUSES_CACHE
     foreign key (STATUS_ID) references STATUSES_CACHE (ID);
	 
alter table STATUSES_CACHE add constraint REF_USER_ACCOUNT_FK_STATUSES_CACHE
     foreign key (USER_ID) references USER_ACCOUNT (USER_ID);
-------

alter table TIMELINES add constraint REF_INSTANCE_FK_TIMELINES
     foreign key (INSTANCE) references INSTANCES (ID);

alter table TIMELINES add constraint REF_USER_ACCOUNT_FK_TIMELINES
     foreign key (USER_ID) references USER_ACCOUNT (USER_ID);
-------

alter table USER_ACCOUNT add constraint REF_INSTANCE_FK_USER_ACCOUNT
     foreign key (INSTANCE) references INSTANCES (ID);
	 
alter table USER_ACCOUNT_TEMP add constraint REF_INSTANCE_FK_USER_ACCOUNT_TEMP
     foreign key (INSTANCE) references INSTANCES (ID);
	 
--------

alter table SEARCH add constraint REF_USER_ACCOUNT_FK_SEARCH
     foreign key (USER_ID) references USER_ACCOUNT (USER_ID);
--------

alter table STATUSES_STORED add constraint REF_INSTANCE_FK_STATUSES_STORED
     foreign key (INSTANCE) references INSTANCES (ID);

alter table STATUSES_STORED add constraint REF_USER_ACCOUNT_FK_STATUSES_STORED
     foreign key (USER_ID) references USER_ACCOUNT (USER_ID);
	 
