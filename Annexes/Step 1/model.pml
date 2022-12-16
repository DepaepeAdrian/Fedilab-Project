conceptual schema conceptualSchema{

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
		emojis :text,
		social :text,
		is_moderator: int,
		is_admin: int ,
		client_id: text,
		client_secret :text,
		refresh_token: text,
		updated_at: text,
		privacy: text,
		sensitiv: int ,
		instance: text,
		oauth_token :text ,
		created_at: text
	identifier {
		user_id	
		}
	}
	
	entity type STATUSES_STORED {
		id : text,
		user_id : text,
		instance : text,
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
		instance : text ,
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
		user_id : text ,
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
		instance : text ,
		targeted_user_id : text ,
		date_creation : text ,
		date_end : text

	identifier {
			id
		}
	}
	
	entity type STATUSES_CACHE {
		id : text,
		cached_action : int ,
		instance : text ,
		user_id : text ,
		date_backup : text ,
		status_id : text  ,
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
		user_id : text ,
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
		instance : text ,
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
		user_id : text ,
		instance : text ,
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
		user_id : text ,
		instance : text ,
		type : text ,
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
		instance : text ,
		user_id : text ,
		cache : text ,
		daate : text

	identifier {
			id
		}
	}
	entity type NOTIFICATION_CACHE {
		id : int,
		notification_id : text ,
		instance : text ,
		user_id : text ,
		account : text ,
		type : text ,
		status_id : text ,
		in_reply_to_id : text,
		status_id_cache : text ,
		created_at : text 		
	identifier {
		id	
		}
	}
	entity type MAIN_MENU_ITEMS {
		id : int,
		user_id : text ,
		instance : text ,
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
	

}