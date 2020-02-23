# aws-lambda-custom-packages

### If you faces problems with packages that are not working with AWS Lambda because

#### packages installed with  precompiled for your plateform (mac, windows) which is different than AWS linux distribution 
or
#### you want to target certain specificiation for AWS Lambda (python version which is not exsiting in your local machine)


## prerequisite
Docker https://www.docker.com/install/

##Steps required
1- checkout the repo
2- download the prefered python version (https://www.python.org/ftp/python/) and extract the package in  a sub-directy inside src directroy.
for example: 
if you are looking for python 3.8, you can download Python-3.8.0.tgz from the url https://www.python.org/ftp/python/ and extract.
Copy the output of the extraction (should be a dir with a name Python-3.8.0)to src directory

3- add your required packages in requirements.txt in src dir
you have 3 examples (pandas, numpy, lxml)

4- run the following command 
docker build -t python-lambda .

5- extract the packages  
run -it --rm --name py-lamb -v /Users/youruser/aws-lambda-custom-packages/src/site-package:/zipped-package python-lambday /bin/bash

