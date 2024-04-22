#BASE STEUP

#doing development in command line (not RStudio)
FROM rocker/r-ubuntu as base

# installs, *NOTE* put pandoc last-sometimes other installs after pandoc mess with it
RUN DEBIAN_FRONTEND=noninteractive
RUN apt-get update
RUN echo 'hi'
RUN apt-get install -y vim zlib1g-dev libcurl4-openssl-dev libxml2-dev cmake

# create working home directory
RUN mkdir /project
WORKDIR /project

# RENV SETUP 
# ignore "project is out of sync errors *if* they are related to the version of R"
# create a folder called renv in the working directory you just created that will hold all renv-associated files
RUN mkdir -p renv

#copy renv-associated files into that folder (settings may be .json file)
COPY renv.lock renv.lock
COPY .Rprofile .Rprofile
COPY renv/activate.R renv/activate.R
COPY renv/settings.json renv/settings.json

#add the following lines to your Dockerfile to change the default location of the renv cache to be in your project directory.
RUN mkdir renv/.cache
ENV RENV_PATHS_CACHE renv/.cache

#add the following line to your Dockerfile to restore the package library.
RUN R -e "renv::restore(prompt = FALSE)"

#"docker build -t base ."

# FOLDER SETUP (do not edit above this line)

#these lines build a second image in same Dockerfile 
#but, just copying the contents of the project directory so we don't have to reinstall package library again

FROM rocker/r-ubuntu
WORKDIR /project
COPY --from=base /project .

#"docker build -t final ."

# COPY ALL RELEVANT FOLDERS + FILES OTHER THAN RENV

RUN mkdir code
RUN mkdir data
RUN mkdir figures
RUN mkdir report
RUN mkdir tables 

COPY Makefile Makefile
COPY README.md README.md
COPY code/ code
COPY data/ data

RUN apt-get update
RUN apt-get install -y pandoc

# ENTRY POINT: START AT THE MAKE FILE 
CMD make

#test this step: winpty docker run -v "/$(pwd)"/report:/project/report final
#docker run -v "$(pwd)"/SUBDIRECTORY_WITH_REPORT_LOCAL:/project/SUBDIRECTORY_WITH_REPORT_DOCKER <your_image_name>

#to upload to DockerHun
#git bash $ docker build sswien/final (if creating a new image) OR
#git bash $ docker tag final sswien/final
#type docker image ls: should see same image ID, but one has DockerHub user your_image_name
#THEN TO push
#docker push sswien/final
