echo "Please select your favourite team in IPL"
echo "rcb csk mi"
read teamName
#Array
rcbTeam=("Siraj" "Maxwell" "Virat" "Duplessis")
miTeam=("Pollard" "Ishan" "Rohit" "Bumrah")
cskTeam=("Deepak" "Jadeja" "Watson" "Dhoni")
#Variables Declared Globally
matchPlayed=14
win=0
lose=0
nrr=""
points=0
position=0

#Functions
function errorHandler() {
echo "Please Check your input $1, It is invalid"
}
function playoffEligibility() {
if [ $1 -le 4 ]
then
echo "$2 Is Eligible for Playoffs"
else
echo "$2 Is Not-Eligible for Playoffs"
fi
}
function playersByRoleAndResposibility() {
echo "$2 is a $1 of Team $3"
}
function playersByTeam() {
if [ $1 == "rcb" ]
then
for player in ${rcbTeam[*]}
do
if [ $player == "Maxwell" ]
then
playersByRoleAndResposibility "All-rounder" $player $1
elif [ $player == "Virat" ]
then
playersByRoleAndResposibility "Batsman" $player $1
elif [ $player == "Siraj" ]
then
playersByRoleAndResposibility "Bowler" $player $1
else
playersByRoleAndResposibility "Captain" $player $1
fi
done
fi

if [ $1 == "mi" ]
then
for player in ${miTeam[*]}
do
if [ $player == "Pollard" ]
then
playersByRoleAndResposibility "All-rounder" $player $1
elif [ $player == "Ishan" ]
then
playersByRoleAndResposibility "Batsman" $player $1
elif [ $player == "Bumrah" ]
then
playersByRoleAndResposibility "Bowler" $player $1
else
playersByRoleAndResposibility "Captain" $player $1
fi
done
fi

if [ $1 == "csk" ]
then
for player in ${cskTeam[*]}
do
if [ $player == "Jadeja" ]
then
playersByRoleAndResposibility "All-rounder" $player $1
elif [ $player == "Watson" ]
then
playersByRoleAndResposibility "Batsman" $player $1
elif [ $player == "Deepak" ]
then
playersByRoleAndResposibility "Bowler" $player $1
else
playersByRoleAndResposibility "Captain" $player $1
fi
done
fi

}
function pointsCalculator() {
lose=$(($matchPlayed-$3))
points=$(($3*2))
echo "Name of Team $1"
echo "Place $2"
echo "Matches Played $matchPlayed"
echo "Won $3 and Lost $lose"
echo "RunRate $4"
echo "Points Secured $points"
playoffEligibility $2 $1
playersByTeam $1
}
#Step1
if [ $teamName == "mi" ]
then
position=10
elif [ $teamName == "rcb" ]
then
position=4
elif [ $teamName == "csk" ]
then
position=9
else
errorHandler $teamName
fi
#Step2
if [ $position -gt 0 ]
then
case $position in
10)
win=4
nrr="-0.506"
pointsCalculator $teamName $position $win $nrr
;;
9)
win=4
nrr="-0.203"
pointsCalculator $teamName $position $win $nrr
;;
4)
win=8
nrr="-0.253"
pointsCalculator $teamName $position $win $nrr
;;
*)
echo " "
;;
esac
fi
