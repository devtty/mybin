#!/bin/bash

chk_follower_count () {
    last_progress=($(sqlite3 -separator " " social.sqlite "SELECT followers, created FROM igaccount_progress WHERE profile_id=1 ORDER BY created DESC LIMIT 1"))
    echo "followers: ${last_progress[0]}"
    echo "created: ${last_progress[1]}"

    #compare with old value and update if it is outdated by 14days
    if [ $(date --date="${last_progress[1]} +14 day" +%s) -le $(date +%s) ]; then
	echo "Progress data is outdated."
	echo "How many posts?"
	read act_posts
	echo "How many are following you?"
	read act_followers
	echo $((act_followers-followers))
	echo "How many are you following?"
	read act_following

	$(sqlite3 social.sqlite "INSERT INTO igaccount_progress VALUES (1, $act_followers, $act_following, $act_posts, CURRENT_TIMESTAMP);")
    fi

    #compare with available data
    
}

if [[ -z $1 ]]
then
    echo "no account name given"
    account_total=$(sqlite3 social.sqlite "SELECT count(*) FROM igaccount")
    followers=$(sqlite3 social.sqlite "SELECT count(*) FROM igaccount i INNER JOIN igaccount_activity ia ON ia.profile_id = i.id WHERE ia.follows = 1") 
    echo "Total account: $account_total"
    echo "Follower: $followers"
    chk_follower_count
else
    exists=$(sqlite3 social.sqlite "SELECT id from igaccount where name = '$1';")
    
    if (( exists > 0 )); then
	echo "exists already"
	
    else
	# no id insert
	exists=$(sqlite3 social.sqlite "INSERT INTO igaccount VALUES (null, '$1'); SELECT last_insert_rowid();")
	echo "is now $exists"
    fi

    # like,comment,follows,unfollows
    sqlite3 social.sqlite "INSERT INTO igaccount_activity VALUES ($exists,0,0,0,0,date('now'));"
    
    echo $exists
fi
