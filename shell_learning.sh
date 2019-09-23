#!/bin/bash
set -e

FILE="$0"

echo "Using files: ${FILE}"
JQUERY=''
ssh data@sleet.lga.appfigures.com "pypy diffs.py $FILE | jq  -c '$JQUERY'" > diff.json
echo 'Comparing diffs and running'
cmp -s old_diff.json diff.json &&  echo "Old and new diff file are the same. Try and rerun again later." || sudo -H -u josh python beta_update.py -f diff.json
echo 'SimApp Update Complete'


# appbase-stats.sh
#!/bin/bash
set -e

DATE="$1"
YEAR=`date -d $DATE +'%G'`
gsutil cat gs://appbase-us/$YEAR/$DATE-full.gz | pv | zcat | ./remove_sizes.sh | ./jquery.sh | python appbase_main.py -d $DATE -db appbase.db


# make .sh excutable
chmod +x appbase-stats.sh

# run .sh file with arg
./appbase-stats.sh 2019-01-01

# open a file and could edit it. ^x for saving
nano appbase-stats.sh 

# parallel dryrun check if the sh could run
parallel --dryrun './appbase-stats.sh {}' ::: 2019-03-01 2019-02-01 
# parallel computing with two args 
parallel './appbase-stats.sh {}' ::: 2019-03-01 2019-02-01
# zcat file and run it on python
pv appbase.gz | zcat | ./remove_sizes.sh | ./jquery.sh | python appbase_main.py --date 2019-03-21 --database appbase.db


# enter virtual environment
virenv "folder"
source "folder"/bin/activate
eg. source appbase/bin/activate


# appbase_daily.sh
#!/bin/bash
set -e
cd /home/george/appbase-stats/
source appbase/bin/activate
DATE=$(date -d '1 day ago' +%Y-%m-%d)
ssh george@bowser.lga.appfigures.com "cat /opt/product-diff-output/$DATE-full" | pv | ./remove_sizes.sh | ./jquery.sh $DATE | python appbase_main.py -d $DATE


# crontab -e
# create automation start at 10am daily, file any progress into log.txt
0 10 * * * bash /home/george/appbase-stats/appbase-daily.sh > /home/george/appbase-stats/log.txt 2>&1





#zcat appbase.gz | ./remove_sizes.sh | jq -r '[.active, .product_id, .store, .categories.main, (.categories.all|tostring), .type, .deviceset, (.prices|tostring), ((.sdks | map( [.sdk_id, .active ]) | tostring))]| @csv'

#zcat appbase.gz | ./remove_sizes.sh | jq -r '[.active, .product_id, .store, [if .categories.main then .categories.main else (.categories.all|tostring) end], .type, .deviceset, [if .prices["143441"] then .prices["143441"] else (.prices|tostring) end], ((.sdks | map( [.sdk_id, .active ]) | tostring))]| @csv'

# use this one for jquery.sh
#zcat appbase.gz | ./remove_sizes.sh | jq -r '[.active, .product_id, .store] + [if .categories["main"] then .categories["main"] else ( .categories["all"] | tostring) end] + [.type, .deviceset] + [if .prices["143441"] then .prices["143441"] else (.prices|tostring) end] + [((.sdks | map( [.sdk_id, .active ]) | tostring))]| @csv'

#get_product_file.sh | ./remove_sizes.sh | jq -r 'select(.["active"] == true)  | [.product_id, .store, .name, .developer] +  [if .categories.main then .categories.main else .categories.all end] + [if .["meta"]["primary_description.EN"] then .["meta"]["primary_description.EN"] else .["meta"]["primary_description.en"] end] +  [.deviceset] + [if .prices.US then .prices.US else .prices end] + [.type] +  [if .["meta"]["all_rating.EN"] then .["meta"]["all_rating.EN"] else .["meta"]["all_rating.en"] end] + [if .["meta"]["all_rating_count.EN"] then .["meta"]["all_rating_count.EN"] else .["meta"]["all_rating_count.en"] end] | @json' > SimApp.json



#pv appbase.gz | zcat | ./remove_sizes.sh | ./jquery.sh | python appbase_main.py --date 2019-03-21 --database appbase.db
#pv 2019-03-21-full | ./remove_sizes.sh | ./jquery.sh | python appbase_main.py --date 2019-03-21 --database appbase.db


#//SQL
#select date, categories, cat_name, sum(counts) from appbase_stats where report == 3 and active == 1 and deviceset in (1, 2, 3, 9, 10, 11) group by date, cat_name, categories;
#select date, store, cat_name, sum(counts) from appbase_stats where report == 3 and active == 1 and deviceset in (1, 2, 3, 9, 10, 11) group by date, store, cat_name limit 50;




################   Shell File Create & Git  ################

# initialize a directory for git
git init

# set up the remote repository link with git
git remote add origin http://.......
# test_suite reposity with token
https://f8bba28cd809b5fc63939e99d4b3356aef39ffb9:x-oauth-basic@github.com/appfigures/Test_Suite.git

# check if the link works
git remote -v

# add all files in the current directory on git
git add .

# commit the files
git commit -m 'Comment first commit'

# push the commits to master
git push origin master

# check git status (tracked / untracked file)
git status 

#
git fetch
git merge origin/master
git merge origin HEAD  
git push origin HEAD

# After file change in falkor, check difference with file on git
git diff all_countries_afp.R

# create working directory under root, but since it is under root, we cannot save files in there
sudo makdir sales-estimates

# change the current user instead of root, so we can save file
sudo chown $user

# clone the repository online
git clone https://github.com/libgit2/libgit2 (ssh key)


################ linux virtual machine ##################

# install virtual envirment package
pip install virtualenv

# create virtual environment folder for code to run
virtualenv test1

# activate the virtual environment and now we are in the virtualenv
source test1/bin/activate

# check if everything is under virtualenv; check version we installed pandas
which python
pip install pandas....
ls /home/george/test1/lib/python2.7/site-packages/ | grep pandas

# deactivate virtualenv and return to the global environment
deactivate


# create a tunnel to connect artax to web brower using jupyter notebook
# Source port: 8889 //// Destination localhost:8889




################ linux learn example ##################

# texted htop so you can grep
ps aux 

# simple command example data manipulation
zcat, | head, awk, cut
grep, jq, replace, echo
sudo, su, nano


# zcat the .gz file and use cut to separate the line by tab delimiter, return field 1,2,9,10 (columns), and save it to a tsv file
zcat reviews_pre.tsv.gz | cut -f 1,2,9,10 -d$’/t’ > reviews.tsv

# run all_rank_fafp.R to get data
Rscript all_ranks_afp.R --start_date 2018-02-01 --end_date 2018-07-01 --store apple --subcategory free --file apple_finance.csv --country PE --categories 6014,6015 --lead 6 

# check status / list of docker running
sudo docker ps




############################### test on falkor ############################
# lm / rq
Rscript test_suite/data_test1.R --start_date 2018-10-01 --end_date 2019-02-01 --store android --subcategory free --lead 20 --country GB --serial_id 53,56,57,59 --online_id 53 --model android_free_GB_base.RDS@android_free_GB_base2.RDS --model_online "53@lm@L_SAD_Ed_P ~ -1 + poly(L_vol_rank_6,2) + as.factor(month) + as.factor(year) + as.factor(weekend) + holidays2" 

# gam / glm
Rscript test_suite/data_test1.R --start_date 2018-10-01 --end_date 2019-02-01 --store android --subcategory free --lead 20 --country GB --serial_id 53,56,57,59 --online_id 53 --model android_free_GB_base.RDS@android_free_GB_base2.RDS --model_online "53@glm@L_SAD_Ed_P ~ -1 + poly(L_vol_rank_6,2) + as.factor(month) + as.factor(year) + as.factor(weekend) + holidays2@family@poisson@link@identity"

# data_test2
Rscript test_suite/data_test2.R --start_date 2018-01-01 --end_date 2018-04-01 --store android --subcategory free --lead 20 --country GB --online_id 53



53@glm@L_SAD_Ed_P ~ -1 + poly(L_vol_rank_6,2) + as.factor(month) + as.factor(year) + as.factor(weekend) + holidays2@family@poisson@link@identity@56@lm@L_SAD_Ed_P ~ -1 + poly(L_vol_rank_6,2) + as.factor(month) + as.factor(year) + as.factor(weekend) + holidays2


 L_SAD_Ed_P ~ -1 + poly(L_vol_rank_6,2) + as.factor(day) + as.factor(month) + as.factor(holiday)