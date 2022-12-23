conceptual schema cs{

	entity type USER_ACCOUNT {
user_id	: text,
username : text,
acct : text,
displayed_name : text,
locked : int ,
followers_count: int ,
following_count :int ,
statuses_count: int ,
note :text ,
url :text ,
avatar: text ,
avatar_static: text ,
header: text ,
header_static: text ,
social :text,
is_moderator: int,
is_admin: int ,
client_id: text,
client_secret :text,
refresh_token: text,
updated_at: text,
privacy: text,
sensitiv: int ,
oauth_token :text ,
created_at: text
		identifier {
		user_id	
		}
	}
	
	entity type STATUSES_STORED {
id : text,
status_serialized :  text,
status_reply_serialized : text,
date_creation : text ,
is_scheduled :  int,
date_scheduled : text,
sent : int,
date_sent : text
		identifier {
		id	
		}
	}
	

	entity type CUSTOM_EMOJI {
id : int,
date_creation : text ,
shoertcode : text ,
url : text ,
url_static : text
		identifier {
			id
		}
	}
	
		entity type SEARCH {
id : int,
keywords : text ,
any_tag : text ,
all_tag : text ,
none_tag : text ,
name : text ,
is_art : text ,
is_nsfw : text ,
date_creation : text 
		identifier {
			id
		}
	}
	
		entity type TEMP_MUTE {
id :int,
acct : text ,
date_creation : text ,
date_end : text

		identifier {
			id
		}
	}
	
	entity type STATUSES_CACHE {
id : text,
cached_action : int ,
date_backup : text ,
uri : text ,
url : text ,
account : text ,
in_reply_to_id : text,
in_reply_to_account_id : text,
reblog : text,
content : text ,
created_at : text ,
emojis : text,
reblogs_count : int ,
favourites_count : int ,
reblogged : int,
favourited : int,
muted : int,
sensitiv : int,
spoiler_text : text,
visibility : text ,
media_attachments : text,
card : text,
mentions : text,
poll : text,
tags : text,
application : text,
language : text,
pinned : int 
		identifier {
		id	
		}
	}
	
	entity type USER_ACCOUNT_TEMP {
user_id : text,
username : text ,
acct : text ,
displayed_name : text ,
locked : int ,
followers_count : int ,
following_count : int ,
statuses_count : int ,
note : text ,
url : text ,
avatar : text ,
avatar_static : text ,
header : text ,
header_static : text ,
emojis : text,
social : text,
is_moderator : int ,
is_admin : int ,
client_id : text,
client_secret : text,
refresh_token : text,
updated_at : text,
privacy : text,
sensitiv : int,
instance : text ,
oauth_token : text ,
created_at : text

		identifier {
			user_id
		}
	}
	
	entity type INSTANCES {
id : text,
instance : text ,
instance_type : text ,
tags : text ,
filtered_with : text ,
date_creation : text
		identifier {
		id	
		}
	}
	entity type PEERTUBE_FAVOURITES {
id : int,
uuid : text ,
cache : text ,
daate : text 
//replace date to daate for syntax
		identifier {
			id
		}
	}
	entity type CACHE_TAGS {
id : int,
tags : text

		identifier {
			id
		}
	}
	entity type BOOST_SCHEDULE {
id : int,
status_serialized : text ,
date_scheduled : text,
is_scheduled : int ,
sent : int ,
date_sent : text
		identifier {
			id
		}
	}
	entity type TRACKING_BLOCK  {
id : int,
domain : text

		identifier {
			id
		}
	}
	entity type TIMELINES {
id : int,
position : int ,
tyype : text ,
remote_instance : text,
tag_timeline : text,
displayed : int ,
list_timeline : text

		identifier {
			id
		}
	}
	entity type TIMELINE_CACHE  {
id : int,
cache : text ,
daate : text

		identifier {
			id
		}
	}
	entity type NOTIFICATION_CACHE {
id : int,
notification_id : text ,
user_id : text ,
account : text ,
tyype : text ,
in_reply_to_id : text,
created_at : text 		
		identifier {
		id	
		}
	}
	entity type MAIN_MENU_ITEMS {
id : int,
nav_news : int ,
nav_list : int ,
nav_scheduled : int ,
nav_archive : int ,
nav_archive_notifications : int ,
nav_peertube : int ,
nav_filters : int ,
nav_how_to_follow : int ,
nav_administration : int ,
nav_blocked : int ,
nav_muted : int ,
nav_blocked_domains : int ,
nav_trends : int ,
nav_howto : int 		
		identifier {
			id
		}
	}
	entity type USER_NOTES {
id : int,
acct : text ,
note : text,
date_creation : text

		identifier {
			id
		}
	}
	
	
/////////////////////	
// relationship type 
/////////////////////



    relationship type instance_notification{
		instance[0-N]: INSTANCES,
		notification[1]: NOTIFICATION_CACHE
	}
	
    relationship type statusstore_notification{
		status[0-N]: STATUSES_STORED,
		notification[1]: NOTIFICATION_CACHE
	}
	
	relationship type statuscache_notification{
		status[0-N]: STATUSES_CACHE,
		notification[1]: NOTIFICATION_CACHE
	}
	
	relationship type user_notification{
		user[0-N]: USER_ACCOUNT ,
		notification[1]: NOTIFICATION_CACHE
	}


	relationship type instance_timeline{
		instance[0-N]: INSTANCES ,
		timeline[1]: TIMELINE_CACHE
	}
	relationship type statuscache_timeline{
		status[0-N]: STATUSES_CACHE ,
		timeline[1]: TIMELINE_CACHE
	}
	relationship type user_timeline{
		user[0-N]: USER_ACCOUNT ,
		timeline[1]: TIMELINE_CACHE
	}
	
	relationship type user_instances{
		user[1]: USER_ACCOUNT,
		instance[0-N]: INSTANCES
	}
	
	relationship type instances_main_menu_items{
		instance[0-N]: INSTANCES
		mainmenu[1]: MAIN_MENU_ITEMS
	}
	
	relationship type user_main_menu_items{
		user[0-N]: USER_ACCOUNT
		mainmenu[1]: MAIN_MENU_ITEMS
	}
	
	
	relationship type instance_boost {
		boost[0-N]: BOOST_SCHEDULE
		mainmenu[1]: MAIN_MENU_ITEMS
	}
	relationship type user_boost {
		user[0-N]: USER_ACCOUNT
		mainmenu[1]: MAIN_MENU_ITEMS
	}
	
	relationship type instances_mute {
		instance[0-N]: INSTANCES
		mute[1]: TEMP_MUTE
	}
	relationship type user_mute {
		user[1]: USER_ACCOUNT
		mute[1]: TEMP_MUTE
	}	
	relationship type instance_emoji {
		instance[0-N]: INSTANCES
		emoji[1]: CUSTOM_EMOJI
	}	
	relationship type instances_statuscache {
		instance[0-N]: INSTANCES
		status[1]: STATUSES_CACHE
	}		
	
	relationship type user_statuscache {
		user[1]: USER_ACCOUNT
		status[1]: STATUSES_CACHE
	}
	
	relationship type instances_TIMELINES {
		instance[0-N]: INSTANCES
		timelines[1]: TIMELINES
	}	
	relationship type user_timelines {
		user[1]: USER_ACCOUNT
		timelines[1]: TIMELINES
	}
	relationship type instances_user {
		user[1]: USER_ACCOUNT
		instance[0-N]: INSTANCES
	}
		relationship type emoji_user {
		emoji[1]: CUSTOM_EMOJI
		user[1]: USER_ACCOUNT
	}
	relationship type instances_user {
		user[1]: USER_ACCOUNT
		instance[0-N]: INSTANCES
	}
	
	relationship type instances_usertemp {
		instance[0-N]: INSTANCES
		usertemp[1]: USER_ACCOUNT_TEMP
	}
	
	relationship type user_search {
		user[1]: USER_ACCOUNT
		search[0-N]: SEARCH
	}
	
	relationship type instances_statusstored {
		instance[0-N]: INSTANCES
		statusstored[0-N]:STATUSES_STORED
	}
	
	relationship type user_statusstored {
		user[1]: USER_ACCOUNT
		statusstored[0-N]:STATUSES_STORED
	}
	
	
physical schemas {
	relational schema myRelSchema : mydb {
		
		
		table USER_ACCOUNT {
			columns {
				USERNAME  ,
				ACCT  ,
				DISPLAYED_NAME  ,
				LOCKED  ,
				FOLLOWERS_COUNT  ,
				FOLLOWING_COUNT  ,
				STATUSES_COUNT  ,
				NOTE  ,
				URL  ,
				AVATAR  ,
				AVATAR_STATIC  ,
				HEADER  ,
				HEADER_STATIC  ,
				EMOJIS ,
				SOCIAL ,
				IS_MODERATOR  ,
				IS_ADMIN  ,
				CLIENT_ID ,
				CLIENT_SECRET ,
				REFRESH_TOKEN ,
				UPDATED_AT ,
				PRIVACY ,
				SENSITIV  ,
				INSTANCE  ,
				OAUTH_TOKEN  ,
				CREATED_AT

					}
				}

		
		table STATUSES_STORED {
			columns {
				USER_ID  ,
				INSTANCE  ,
				STATUS_SERIALIZED  ,
				STATUS_REPLY_SERIALIZED ,
				DATE_CREATION  ,
				IS_SCHEDULED  ,
				DATE_SCHEDULED ,
				SENT  ,
				DATE_SENT 
					}
				}
			

		table CUSTOM_EMOJI {
			columns {
				DATE_CREATION  ,
				INSTANCE  ,
				SHOERTCODE  ,
				URL  ,
				URL_STATIC 
					}
				}
			
		
		table  SEARCH{
			columns {
				KEYWORDS  ,
				USER_ID  ,
				ANY_TAG  ,
				ALL_TAG  ,
				NONE_TAG  ,
				NAME  ,
				IS_ART  ,
				IS_NSFW  ,
				DATE_CREATION 
					}
				}
			
		table TEMP_MUTE  {
			columns {
				ACCT  ,
				INSTANCE  ,
				TARGETED_USER_ID  ,
				DATE_CREATION  ,
				DATE_END
					}
				}
			
			
		table STATUSES_CACHE {
			columns {
				CACHED_ACTION  ,
				INSTANCE  ,
				USER_ID  ,
				DATE_BACKUP  ,
				STATUS_ID   ,
				URI  ,
				URL  ,
				ACCOUNT  ,
				IN_REPLY_TO_ID ,
				IN_REPLY_TO_ACCOUNT_ID ,
				REBLOG ,
				CONTENT  ,
				CREATED_AT  ,
				EMOJIS ,
				REBLOGS_COUNT  ,
				FAVOURITES_COUNT  ,
				REBLOGGED ,
				FAVOURITED ,
				MUTED ,
				SENSITIV ,
				SPOILER_ ,
				VISIBILITY  ,
				MEDIA_ATTACHMENTS ,
				CARD ,
				MENTIONS ,
				POLL ,
				TAGS ,
				APPLICATION ,
				LANGUAGE ,
				PINNED
					}
				}
			
			
		table USER_ACCOUNT_TEMP {
			columns {
				USERNAME  ,
				ACCT  ,
				DISPLAYED_NAME  ,
				LOCKED  ,
				FOLLOWERS_COUNT  ,
				FOLLOWING_COUNT  ,
				STATUSES_COUNT  ,
				NOTE  ,
				URL  ,
				AVATAR  ,
				AVATAR_STATIC  ,
				HEADER  ,
				HEADER_STATIC  ,
				EMOJIS ,
				SOCIAL ,
				IS_MODERATOR  ,
				IS_ADMIN  ,
				CLIENT_ID ,
				CLIENT_SECRET ,
				REFRESH_TOKEN ,
				UPDATED_AT ,
				PRIVACY ,
				SENSITIV  ,
				INSTANCE  ,
				OAUTH_TOKEN  ,
				CREATED_AT
					}
				}
			

		table INSTANCES {
			columns {
				INSTANCE  ,
				USER_ID  ,
				INSTANCE_TYPE  ,
				TAGS  ,
				FILTERED_WITH  ,
				DATE_CREATION 
					}
				}
			

		table PEERTUBE_FAVOURITES {
			columns {
				UUID  ,
				INSTANCE  ,
				CACHE  ,
				DATE 
									}
				}
		

		table  CACHE_TAGS{
			columns {
				TAGS
					}
				}
			
	
		table BOOST_SCHEDULE {
			columns {
				USER_ID  ,
				INSTANCE  ,
				STATUS_SERIALIZED  ,
				DATE_SCHEDULED ,
				IS_SCHEDULED  ,
				SENT  ,
				DATE_SENT
					}
				}
			

		table TRACKING_BLOCK {
			columns {
				DOMAIN 
					}
				}
			
		table TIMELINES {
			columns {
				POSITION  ,
				USER_ID  ,
				INSTANCE  ,
				TYPE  ,
				REMOTE_INSTANCE ,
				TAG_TIMELINE ,
				DISPLAYED  ,
				LIST_TIMELINE
					}
				}
			

		table  TIMELINE_CACHE {
			columns {
				STATUS_ID   ,
				INSTANCE  ,
				USER_ID  ,
				CACHE  ,
				DATE 
					}
				}
			
	
		table NOTIFICATION_CACHE {
			columns {
				NOTIFICATION_ID  ,
				INSTANCE  ,
				USER_ID  ,
				ACCOUNT  ,
				TYPE  ,
				STATUS_ID  ,
				IN_REPLY_TO_ID ,
				STATUS_ID_CACHE  ,
				CREATED_AT 
					}
				}
			
	
		table  MAIN_MENU_ITEMS {
			columns {
				USER_ID  ,
				INSTANCE  ,
				NAV_NEWS  ,
				NAV_LIST  ,
				NAV_SCHEDULED  ,
				NAV_ARCHIVE  ,
				NAV_ARCHIVE_NOTIFICATIONS  ,
				NAV_PEERTUBE  ,
				NAV_FILTERS  ,
				NAV_HOW_TO_FOLLOW  ,
				NAV_ADMINISTRATION  ,
				NAV_BLOCKED  ,
				NAV_MUTED  ,
				NAV_BLOCKED_DOMAINS  ,
				NAV_TRENDS  ,
				NAV_HOWTO 
					}
				}
			
	
		table USER_NOTES {
			columns {
				ACCT  ,
				NOTE ,
				DATE_CREATION
					}
				}

		}
}								

mapping rules{
	conceptualSchema.Actor(id,fullName,yearOfBirth,yearOfDeath) -> IMDB_Mongo.actorCollection(id,fullname,birthyear,deathyear),
	conceptualSchema.movieActor.character-> IMDB_Mongo.actorCollection.movies(),
	conceptualSchema.Director(id,firstName,lastName, yearOfBirth,yearOfDeath) -> myRelSchema.directorTable(id,firstname,lastname,birth,death),
	conceptualSchema.movieDirector.director -> myRelSchema.directed.directed_by,
	conceptualSchema.movieDirector.directed_movie -> myRelSchema.directed.has_directed,
	conceptualSchema.movieDirector.directed_movie -> myRelSchema.directed.movie_info,
	conceptualSchema.Movie(id) -> movieRedis.movieKV(id),
	conceptualSchema.Movie(primaryTitle,originalTitle,isAdult,startYear,runtimeMinutes) ->movieRedis.movieKV(title,originalTitle,isAdult,startYear,runtimeMinutes), 
	conceptualSchema.Movie(averageRating,numVotes) -> IMDB_Mongo.actorCollection.movies.rating(rate,numberofvotes),
	conceptualSchema.Movie(id, primaryTitle) -> IMDB_Mongo.actorCollection.movies(id,title)
}


databases {
	sqlite mydb {
		host: localhost
		port: 3307
		login: "root"
		password: "password"
	}
	


