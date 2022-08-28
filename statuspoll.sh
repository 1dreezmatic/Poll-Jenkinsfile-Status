curl -i -u ${USER}:${PWORD} ${JENKINS_URL}/${JOB_NAME}/build?token=${JOB_TOKEN} > Tempfile

LastBuildId=$(sed -r 's/.*"displayName":"([^"]+)".*/\1/' Tempfile | tail -n 1 | cut -c 2-)
          
echo last build number was ${LastBuildId}
          
#trigger new build
          
curl -i -u ${USER}:${PWORD} ${JENKINS_URL}/${JOB_NAME}/build?token=${JOB_TOKEN}

#get status of new build
          
curl -i -u ${USER}:${PWORD} ${JENKINS_URL}/${JOB_NAME}/build?token=${JOB_TOKEN}/$((LastBuildId+1))/api/json" > NewTemp
          
Status_Result=$(sed -r 's/.*"result":"([^"]+)".*/\1/' NewTemp | tail -n 1)
          
until [[ "${Status_Result}" == @(SUCCESS|FAILURE) ]]
do
  sleep 30
            
  curl -i -u ${USER}:${PWORD} ${JENKINS_URL}/${JOB_NAME}/build?token=${JOB_TOKEN}/$((LastBuildId+1))/api/json" > NewTemp
  
  Status_Result=$(sed -r 's/.*"result":"([^"]+)".*/\1/' NewTemp | tail -n 1)
done
          
echo Build number $((LastBuildId+1)) was a ${Status_Result}
          
#fail workflow if Jenkins job fails
          
if [ "${Status_Result}" == "FAILURE" ]; then exit 1; fi
