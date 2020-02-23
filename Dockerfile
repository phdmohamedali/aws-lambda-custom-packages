FROM amazonlinux:latest

RUN echo 'alias ll="ls -ltha"' >> ~/.bashrc

RUN yum -y update && \
    yum -y install \
      vim \
      zip 


RUN yum install -y tar
 
RUN yum install -y gcc openssl-devel bzip2-devel libffi-devel


RUN yum install -y make
# Create app directory and add app
ENV APP_HOME /app
ENV APP_SRC $APP_HOME/src
RUN mkdir $APP_HOME
ADD . $APP_HOME

#RUN tar xzf $APP_SRC/Python-3.8.0.tgz
#RUN cd $APP_SRC/Python-3.8.0/
#RUN ls -l .
RUN $APP_SRC/Python-3.8.0/configure --enable-optimizations
RUN make altinstall

RUN python3.8 $APP_SRC/get-pip.py

RUN pip install --no-deps -t $APP_SRC/site-package -r $APP_SRC/requirements.txt

