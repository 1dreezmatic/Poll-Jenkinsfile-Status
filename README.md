## What does this solve?

By default, if one triggers a Jenkins Job from Github pipeline, one has no visibility into the status of the Jenkins job. The Github pipeline would likely return a status of 0 and jobs go green. But, the Jenkins job may fail.
So, unless one goes to the Jenkins UI or use contact its API, one would not know when the job finished running nor its status code.

## Use Case?

Let's say you adopted Github as your Origin of choice and you would love to keep using Actions since you can write/modify them as you wish for any task. But, you need to set up a Jenkins pipeline for your testers who have their secure Plugins and know their way around Jenkins way better. You could set up a Jenkins Test Job for them, using your Github repo. This is just one of numerous use cases available.

## How?

Trigger the Jenkins Job, poll the Jenkins API for that job status, and pass the Github pipeline only if the Jenkins pipeline completed with a status 0.

NB: You could use jq instead of sed/awk.
