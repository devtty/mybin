#!/bin/bash

if [[ -z $1 ]]
then
    echo "no account name given"
    account_total=$(sqlite3 social.sqlite "SELECT count(*) FROM igaccount")
    followers=$(sqlite3 social.sqlite "SELECT count(*) FROM igaccount i INNER JOIN igaccount_activity ia ON ia.profile_id = i.id WHERE ia.follows = 1") 
    echo "Total account: $account_total"
    echo "Follower: $followers"    
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
