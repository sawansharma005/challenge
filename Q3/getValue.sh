#userinput=`cat a.json`
userinput=$1
function validateuserinput() {
        object=$1
        echo $object|jq -e > /dev/null 2>&1
        if [ $? != 0 ]
        then
                echo "user input is not valid"
        fi
        if [ -z "$object" ]
        then
                echo "object is empty"
        fi
}

function findlastkey() {
        object=$1
        while [ `echo ${object: -1}` == '}' ]
        do
             object=`echo $object|jq -r .[]`
        done
        echo $object
}

validateuserinput "$userinput"
findlastkey "$userinput"
