for item in `ls | grep pdf`

do

   fileName=`echo $item | awk -F. '{ print $1 }'`
   filepdf=`echo $item | awk -F. '{ print $2}'`
        mkdir -p $fileName/$filepdf
   cp -r $item $fileName/$filepdf




done
