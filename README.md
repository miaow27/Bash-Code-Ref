# Bash Script Code Ref

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
