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
status_id : text,
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
status_id : text  ,
cache : text ,
daate : text

		identifier {
			id
		}
	}
	entity type NOTIFICATION_CACHE {
id : int,
notification_id : text ,
status_id : text,
status_id_cache : text ,
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
	
		relationship type instances_favourite{	
		instance[0-N]: INSTANCES,
		favourite[1]: PEERTUBE_FAVOURITES
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
		instance[0-N]: INSTANCES
		boost[0-N]: BOOST_SCHEDULE
	}
	relationship type user_boost {
		user[0-N]: USER_ACCOUNT
		boost[0-N]: BOOST_SCHEDULE
	}
	
	relationship type instances_mute {
		instance[0-N]: INSTANCES
		mute[1]: TEMP_MUTE
	}
	relationship type user_mute {
		user[0-N]: USER_ACCOUNT
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
		user[0-N]: USER_ACCOUNT
		status[1]: STATUSES_CACHE
	}
	
	relationship type instances_TIMELINES {
		instance[0-N]: INSTANCES
		timelines[1]: TIMELINES
	}	
	relationship type user_timelines {
		user[0-N]: USER_ACCOUNT
		timelines[1]: TIMELINES
	}
	relationship type instances_user {
		user[1]: USER_ACCOUNT
		instance[0-N]: INSTANCES
	}
		relationship type emoji_user {
		emoji[0-N]: CUSTOM_EMOJI
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
		statusstored[1]:STATUSES_STORED
	}
	
	relationship type user_statusstored {
		user[0-N]: USER_ACCOUNT
		statusstored[1]:STATUSES_STORED
	}
	

	}
	
physical schemas {
	relational schema myRelSchema : mydb {
		
		
		table USER_ACCOUNT {
			columns {
				USER_ID,
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
			references {
				 instance_by : INSTANCE -> INSTANCES.ID
				 emoji_used : EMOJIS -> CUSTOM_EMOJI.ID
				 }
			}

		
		table STATUSES_STORED {
			columns {
				ID,
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
			references {
				 instance_by : INSTANCE -> INSTANCES.ID
				 used_by : USER_ID -> USER_ACCOUNT.USER_ID
				}
				}
			

		table CUSTOM_EMOJI {
			columns {
				ID,
				DATE_CREATION  ,
				INSTANCE  ,
				SHOERTCODE  ,
				URL  ,
				URL_STATIC 
					}
			references {
				 instance_by : INSTANCE -> INSTANCES.ID
				}
				}
			
		
		table  SEARCH{
			columns {
				ID,
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
			references {
				 used_by : USER_ID -> USER_ACCOUNT.USER_ID
				}
				}
			
		table TEMP_MUTE  {
			columns {
				ID,
				ACCT  ,
				INSTANCE  ,
				TARGETED_USER_ID  ,
				DATE_CREATION  ,
				DATE_END
					}
         references {
				 instance_by : INSTANCE -> INSTANCES.ID
				 used_by : TARGETED_USER_ID -> USER_ACCOUNT.USER_ID
				}
				}
			
			
		table STATUSES_CACHE {
			columns {
				ID,
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
			references {
				 instance_by : INSTANCE -> INSTANCES.ID
				 used_by : USER_ID -> USER_ACCOUNT.USER_ID
				}
				}
			
			
		table USER_ACCOUNT_TEMP {
			columns {
				USER_ID,
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
			references {
				 instance_by : INSTANCE -> INSTANCES.ID

				}
				}
			

		table INSTANCES {
			columns {
				ID ,
				INSTANCE  ,
				USER_ID  ,
				INSTANCE_TYPE  ,
				TAGS  ,
				FILTERED_WITH  ,
				DATE_CREATION 
					}
         references {
				 used_by : USER_ID -> USER_ACCOUNT.USER_ID
				}
				}
			

		table PEERTUBE_FAVOURITES {
			columns {
				ID,
				UUID  ,
				INSTANCE  ,
				CACHE  ,
				DATE 
					}
         references {
				 instance_by : INSTANCE -> INSTANCES.ID
				}					
				}
		

		table  CACHE_TAGS{
			columns {
				ID,
				TAGS
					}
				}
			
	
		table BOOST_SCHEDULE {
			columns {
				ID,
				USER_ID  ,
				INSTANCE  ,
				STATUS_SERIALIZED  ,
				DATE_SCHEDULED ,
				IS_SCHEDULED  ,
				SENT  ,
				DATE_SENT
					}
         references {
				 instance_by : INSTANCE -> INSTANCES.ID
				 used_by : USER_ID -> USER_ACCOUNT.USER_ID
				}
				}
			

		table TRACKING_BLOCK {
			columns {
				ID,
				DOMAIN 
					}
				}
			
		table TIMELINES {
			columns {
				ID,
				POSITION  ,
				USER_ID  ,
				INSTANCE  ,
				TYPE  ,
				REMOTE_INSTANCE ,
				TAG_TIMELINE ,
				DISPLAYED  ,
				LIST_TIMELINE
					}
			references {
				 instance_by : INSTANCE -> INSTANCES.ID
				 used_by : USER_ID -> USER_ACCOUNT.USER_ID
				}
				}
			

		table  TIMELINE_CACHE {
			columns {
				ID,
				STATUS_ID   ,
				INSTANCE  ,
				USER_ID  ,
				CACHE  ,
				DATE 
					}
         references {
				 instance_by : INSTANCE -> INSTANCES.ID
				 status_by : STATUS_ID -> STATUSES_CACHE.ID
				 used_by : USER_ID -> USER_ACCOUNT.USER_ID
				}
				}
			
	
		table NOTIFICATION_CACHE {
			columns {
				ID,
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
         references {
				 instance_by : INSTANCE -> INSTANCES.ID
				 statuscache_by : STATUS_ID_CACHE -> STATUSES_STORED.ID
				 status_by : STATUS_ID -> STATUSES_CACHE.ID
				 used_by : USER_ID -> USER_ACCOUNT.USER_ID
				}
				}
			
	
		table  MAIN_MENU_ITEMS {
			columns {
				ID,
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
         references {
				 instance_by : INSTANCE -> INSTANCES.ID
				 used_by : USER_ID -> USER_ACCOUNT.USER_ID
				}					
				}
			
	
		table USER_NOTES {
			columns {
				ID,
				ACCT  ,
				NOTE ,
				DATE_CREATION
					}
				}

		}
}								

mapping rules{
	cs.USER_ACCOUNT(user_id,username  ,acct ,displayed_name  ,locked  ,followers_count  ,following_count  ,statuses_count  ,note  ,url  ,avatar  ,avatar_static  ,header  ,header_static ,social ,is_moderator  ,is_admin  ,client_id ,client_secret ,refresh_token ,updated_at ,privacy ,sensitiv  ,oauth_token  ,created_at) -> myRelSchema.USER_ACCOUNT(USER_ID,USERNAME  ,ACCT ,DISPLAYED_NAME  ,LOCKED  ,FOLLOWERS_COUNT  ,FOLLOWING_COUNT  ,STATUSES_COUNT  ,NOTE  ,URL  ,AVATAR  ,AVATAR_STATIC  ,HEADER  ,HEADER_STATIC ,SOCIAL ,IS_MODERATOR  ,IS_ADMIN  ,CLIENT_ID ,CLIENT_SECRET ,REFRESH_TOKEN ,UPDATED_AT ,PRIVACY ,SENSITIV  ,OAUTH_TOKEN  ,CREATED_AT),
	cs.instances_user.user -> myRelSchema.USER_ACCOUNT.instance_by,
	cs.emoji_user.user -> myRelSchema.USER_ACCOUNT.emoji_used,
	
	cs.STATUSES_STORED(id,status_serialized  ,status_reply_serialized ,date_creation  ,is_scheduled  ,date_scheduled ,sent  ,date_sent) -> myRelSchema.STATUSES_STORED(ID,STATUS_SERIALIZED  ,STATUS_REPLY_SERIALIZED ,DATE_CREATION  ,IS_SCHEDULED  ,DATE_SCHEDULED ,SENT  ,DATE_SENT),	
	cs.instances_statusstored.statusstored -> myRelSchema.STATUSES_STORED.instance_by,
	cs.user_statusstored.statusstored-> myRelSchema.STATUSES_STORED.used_by,
	//user_id  ,instance 
	
	cs.CUSTOM_EMOJI(id ,date_creation  ,shoertcode  ,url  ,url_static) -> myRelSchema.CUSTOM_EMOJI(ID,DATE_CREATION  ,SHOERTCODE  ,URL  ,URL_STATIC ),
	cs.instance_emoji.emoji -> myRelSchema.CUSTOM_EMOJI.instance_by,
	//instance
	
	cs.SEARCH(id ,keywords ,any_tag  ,all_tag  ,none_tag  ,name  ,is_art  ,is_nsfw  ,date_creation ) -> myRelSchema.SEARCH(ID ,KEYWORDS ,ANY_TAG  ,ALL_TAG  ,NONE_TAG  ,NAME  ,IS_ART  ,IS_NSFW  ,DATE_CREATION),
	cs.user_search.search -> myRelSchema.SEARCH.used_by,
	//user_id
	
	cs.TEMP_MUTE(id ,acct   ,date_creation  ,date_end  ) -> myRelSchema.TEMP_MUTE(ID ,ACCT  ,DATE_CREATION  ,DATE_END ),
	cs.instances_mute.mute -> myRelSchema.TEMP_MUTE.instance_by,
	cs.user_mute.mute -> myRelSchema.TEMP_MUTE.used_by,
	//,instance  ,targeted_user_id 
	
	cs.STATUSES_CACHE(id,cached_action   ,date_backup    ,status_id ,uri  ,url  ,account  ,in_reply_to_id ,in_reply_to_account_id ,reblog ,content  ,created_at  ,emojis ,reblogs_count  ,favourites_count  ,reblogged ,favourited ,muted ,sensitiv , spoiler_text ,visibility  ,media_attachments ,card ,mentions ,poll ,tags ,application ,language ,pinned ) -> myRelSchema.STATUSES_CACHE(ID ,CACHED_ACTION   ,DATE_BACKUP   ,STATUS_ID ,URI  ,URL  ,ACCOUNT  ,IN_REPLY_TO_ID ,IN_REPLY_TO_ACCOUNT_ID ,REBLOG ,CONTENT  ,CREATED_AT  ,EMOJIS ,REBLOGS_COUNT  ,FAVOURITES_COUNT  ,REBLOGGED ,FAVOURITED ,MUTED ,SENSITIV ,SPOILER_ ,VISIBILITY  ,MEDIA_ATTACHMENTS ,CARD ,MENTIONS ,POLL ,TAGS ,APPLICATION ,LANGUAGE ,PINNED),
	cs.instances_statuscache.status -> myRelSchema.STATUSES_CACHE.instance_by,
	cs.user_statuscache.status -> myRelSchema.STATUSES_CACHE.used_by,
	//,instance  ,user_id ,status_id ? weird, don't understand status id here
	
	cs.USER_ACCOUNT_TEMP(user_id ,username  ,acct  ,displayed_name  ,locked  ,followers_count  ,following_count  ,statuses_count  ,note  ,url  ,avatar  ,avatar_static  ,header  ,header_static  ,emojis ,social ,is_moderator  ,is_admin  ,client_id ,client_secret ,refresh_token ,updated_at ,privacy ,sensitiv   ,oauth_token  ,created_at) -> myRelSchema.USER_ACCOUNT_TEMP(USER_ID ,USERNAME  ,ACCT  ,DISPLAYED_NAME  ,LOCKED  ,FOLLOWERS_COUNT  ,FOLLOWING_COUNT  ,STATUSES_COUNT  ,NOTE  ,URL  ,AVATAR  ,AVATAR_STATIC  ,HEADER  ,HEADER_STATIC  ,EMOJIS ,SOCIAL ,IS_MODERATOR  ,IS_ADMIN  ,CLIENT_ID ,CLIENT_SECRET ,REFRESH_TOKEN ,UPDATED_AT ,PRIVACY ,SENSITIV  ,OAUTH_TOKEN  ,CREATED_AT), 
	cs.instances_usertemp.usertemp -> myRelSchema.USER_ACCOUNT_TEMP.instance_by,
	//,instance 
	
	cs.INSTANCES(id,instance  ,instance_type  ,tags  ,filtered_with  ,date_creation) -> myRelSchema.INSTANCES(ID,INSTANCE ,INSTANCE_TYPE  ,TAGS  ,FILTERED_WITH  ,DATE_CREATION), 
	cs.user_instances.instance -> myRelSchema.INSTANCES.used_by,
	//,user_id
	
	cs.PEERTUBE_FAVOURITES(id ,uuid   ,cache  ,daate ) -> myRelSchema.PEERTUBE_FAVOURITES(ID  ,UUID   ,CACHE  ,DATE) ,
	cs.instances_favourite.favourite -> myRelSchema.PEERTUBE_FAVOURITES.instance_by,
	//,INSTANCE 
	
	cs.CACHE_TAGS(id ,tags ) -> myRelSchema.CACHE_TAGS(ID ,TAGS),
	
	cs.BOOST_SCHEDULE(id ,status_serialized  ,date_scheduled ,is_scheduled  ,sent  ,date_sent) -> myRelSchema.BOOST_SCHEDULE(ID ,STATUS_SERIALIZED  ,DATE_SCHEDULED ,IS_SCHEDULED  ,SENT  ,DATE_SENT),  
	cs.instance_boost.boost-> myRelSchema.BOOST_SCHEDULE.instance_by,
	cs.user_boost.boost -> myRelSchema.BOOST_SCHEDULE.used_by,
	//USER_ID  ,INSTANCE  ,
	
	cs.TRACKING_BLOCK(id ,domain) -> myRelSchema.TRACKING_BLOCK(ID ,DOMAIN),
	
	cs.TIMELINES(id  ,position   ,tyype  ,remote_instance ,tag_timeline ,displayed  ,list_timeline) -> myRelSchema.TIMELINES(ID  ,POSITION   ,TYPE  ,REMOTE_INSTANCE ,TAG_TIMELINE ,DISPLAYED  ,LIST_TIMELINE), 
	cs.instances_TIMELINES.timelines -> myRelSchema.TIMELINES.instance_by,
	cs.user_timelines.timelines -> myRelSchema.TIMELINES.used_by,
	//instances user_id
	
	cs.TIMELINE_CACHE(id  ,cache  ,daate  ) -> myRelSchema.TIMELINE_CACHE(ID     ,CACHE  ,DATE ), 
	cs.instance_timeline.timeline -> myRelSchema.TIMELINE_CACHE.instance_by,
	cs.user_timeline.timeline -> myRelSchema.TIMELINE_CACHE.used_by,
	cs.statuscache_timeline.timeline -> myRelSchema.TIMELINE_CACHE.status_by,
	
	
	//instances user_id
	
	cs.NOTIFICATION_CACHE(id ,notification_id  ,account  ,tyype    ,in_reply_to_id  ,created_at) -> myRelSchema.NOTIFICATION_CACHE(ID ,NOTIFICATION_ID  ,ACCOUNT  ,TYPE   ,IN_REPLY_TO_ID  ,CREATED_AT), 
	cs.instance_notification.notification -> myRelSchema.NOTIFICATION_CACHE.instance_by,
	cs.user_notification.notification-> myRelSchema.NOTIFICATION_CACHE.used_by,
	cs.statuscache_notification.notification -> myRelSchema.NOTIFICATION_CACHE.statuscache_by,
	cs.statusstore_notification.notification-> myRelSchema.NOTIFICATION_CACHE.status_by,
	
	//instances user_id ,status_id ,status_id_cache 
	
	cs.MAIN_MENU_ITEMS(id ,nav_news  ,nav_list  ,nav_scheduled  ,nav_archive  ,nav_archive_notifications  ,nav_peertube  ,nav_filters  ,nav_how_to_follow  ,nav_administration  ,nav_blocked  ,nav_muted  ,nav_blocked_domains  ,nav_trends  ,nav_howto ) -> myRelSchema.MAIN_MENU_ITEMS( ID ,NAV_NEWS  ,NAV_LIST  ,NAV_SCHEDULED  ,NAV_ARCHIVE  ,NAV_ARCHIVE_NOTIFICATIONS  ,NAV_PEERTUBE  ,NAV_FILTERS  ,NAV_HOW_TO_FOLLOW  ,NAV_ADMINISTRATION  ,NAV_BLOCKED  ,NAV_MUTED  ,NAV_BLOCKED_DOMAINS  ,NAV_TRENDS  ,NAV_HOWTO), 
	cs.instances_main_menu_items.mainmenu -> myRelSchema.MAIN_MENU_ITEMS.instance_by,
	cs.user_main_menu_items.mainmenu-> myRelSchema.MAIN_MENU_ITEMS.used_by,
		//instances user_id
		
	cs.USER_NOTES(id ,acct  ,note ,date_creation  ) -> myRelSchema.USER_NOTES(ID ,ACCT  ,NOTE ,DATE_CREATION ) 
	
	

	}
	

databases {
	sqlite mydb {
		host: "localhost"
		port: 3307
		login: "root"
		password: "password"
	}



