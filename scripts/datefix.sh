#!/bin/bash

# Rearrange the date format into something more compatible with sqlite
INPUT="";
while read data; do
    
    INPUT=$data;
    
    DATE=`echo $INPUT | sed 's/.*,\(.*\),.*,.*,.*,.*/\1/'`;
    
    # A date probably looks like: 29/Sep/2012:15:55:06+0000
    
      YEAR=`echo $DATE | sed 's/^.*\/.*\/\(.*\):.*:.*:.*+.*$/\1/'`;
     MONTH=`echo $DATE | sed 's/^.*\/\(.*\)\/.*:.*:.*:.*+.*$/\1/'`;
       DAY=`echo $DATE | sed 's/^\(.*\)\/.*\/.*:.*:.*:.*+.*$/\1/'`;
      HOUR=`echo $DATE | sed 's/^.*\/.*\/.*:\(.*\):.*:.*+.*$/\1/'`;
       MIN=`echo $DATE | sed 's/^.*\/.*\/.*:.*:\(.*\):.*+.*$/\1/'`;
       SEC=`echo $DATE | sed 's/^.*\/.*\/.*:.*:.*:\(.*\)+.*$/\1/'`;
    
    # Process the month to a number:
    
    MONTH_NUMB=0;
    
    case "$MONTH" in
    "Jan")
        MONTH_NUMB='01'; 
    ;;
    "Feb")
        MONTH_NUMB='02'; 
    ;;
    
    "Mar")
        MONTH_NUMB='03'; 
    ;;
    
    "Apr")
        MONTH_NUMB='04'; 
    ;;
    
    "May")
        MONTH_NUMB='05'; 
    ;;
    
    "Jun")
        MONTH_NUMB='06'; 
    ;;
    
    "Jul")
        MONTH_NUMB='07'; 
    ;;
    
    "Aug")
        MONTH_NUMB='08'; 
    ;;
    
    "Sep")
        MONTH_NUMB='09'; 
    ;;
    
    "Oct")
        MONTH_NUMB='10'; 
    ;;
    
    "Nov")
        MONTH_NUMB='11'; 
    ;;
    
    "Dec")
        MONTH_NUMB='12'; 
    ;;
    *)
        MONTH_NUMB='99';
    ;;
    esac
    
    ##debug
    #echo "The year is: $YEAR";
    #echo "The month is: $MONTH";
    #echo "The month-numb is: $MONTH_NUMB";
    #echo "The day is: $DAY";
    #echo "The hour is: $HOUR";
    #echo "The min is: $MIN";
    #echo "The sec is: $SEC";

    FORMATTED_DATE="$YEAR-$MONTH_NUMB-$DAY $HOUR:$MIN:$SEC";
    
     LEFT=`echo $INPUT | sed 's/\(.*\),.*,.*,.*,.*,.*/\1/'`
    RIGHT=`echo $INPUT | sed 's/.*,.*,\(.*,.*,.*,.*\)/\1/'`

    # This is the main desired output of the script!
    echo $LEFT,$FORMATTED_DATE,$RIGHT
    
done

