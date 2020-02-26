#!/bin/mksh

# A dwm_bar function to read the battery level and status
# Joe Standring <git@joestandring.com>
# GNU GPLv3

dwm_battery () {
   # Change BAT1 to whatever your battery is identified as. Typically BAT0 or BAT1
   CHARGE=$(cat /sys/class/power_supply/BAT0/capacity)
   STATUS=$(cat /sys/class/power_supply/BAT0/status)
   
   printf "%s" "$SEP1"
   if [ "$IDENTIFIER" = "unicode" ]; then
      if [ "$STATUS" = "Charging" ]; then

         if [ "$CHARGE" -gt 0 ] && [ "$CHARGE" -le 33 ]; then
            printf "\U000F02CF %s" "$STATUS"
         elif [ "$CHARGE" -gt 33 ] && [ "$CHARGE" -le 66 ]; then 
            printf "\U000F02D0 %s" "$STATUS"
         elif [ "$CHARGE" -gt 66 ] && [ "$CHARGE" -le 100 ]; then 
            printf "\U000F02D1 %s" "$STATUS"
         fi 

      elif [ "$STATUS" = "Discharging" ]; then

         if [ "$CHARGE" -gt 0 ] && [ "$CHARGE" -le 33 ]; then
            printf "\U000F02CC %s" "$STATUS"
         elif [ "$CHARGE" -gt 33 ] && [ "$CHARGE" -le 66 ]; then 
            printf "\U000F02CD %s" "$STATUS"
         elif [ "$CHARGE" -gt 66 ] && [ "$CHARGE" -le 100 ]; then 
            printf "\U000F02CE %s" "$STATUS"
         fi 
          
      else [ "$STATUS" = "Full"]
         printf "\uF08F %s" "$STATUS"
       
      fi
   else
       printf "BAT %s" "$STATUS"
   fi
   printf "%s\n" "$SEP2"
}

dwm_battery

