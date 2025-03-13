#!/bin/bash

#Script to push as the hook in GitLab repo , to triger pipeline on Jenkins after push operation

# Read stdin (Git passes: oldrev newrev refname)
read oldrev newrev refname

# Debug output
echo "Old Revision: $oldrev"
echo "New Revision: $newrev"
echo "Reference Name: $refname"

# Extract branch name correctly
IFS='/' read -ra REF <<< "$refname"
branch="${REF[2]}"  # This should be index 2

echo "Branch: $branch"

# If branch is "main", trigger Jenkins
if [ "$branch" == "main" ]; then
    echo "Triggering Jenkins job..."

    crumb=$(curl -u "jenkins:1234" -s 'http://jenkins:8080/crumbIssuer/api/xml?xpath=concat(//crumbRequestField,":",//crumb)')
    
    curl -u "jenkins:1234" -H "$crumb" -X POST "http://jenkins:8080/job/job-dsl/build?delay=0sec"

    if [ $? -eq 0 ]; then
        echo "*** Ok"
    else
        echo "*** Error"
    fi
else
    echo "Not on the main branch, skipping Jenkins trigger."
fi
