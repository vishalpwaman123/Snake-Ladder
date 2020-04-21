#!/bin/bash -x
function initial()
{
	for (( i=0 ;i<100; i++))
	do
		board[$i]=0
	done
}
function display()
{	
	local S=0
	for (( i=0 ;i<10; i++))
	do
		for (( j=0 ; j<10 ;j++))	
		do	
			printf "|---|"
		done
		printf "\n"
		for((j=0;j<10;j++))
		do		 
			printf "| ${board[$S]} |"
			S=$(($S+1))
		done
		printf "\n"
	done
	for(( j=0 ; j<10 ; j++ ))
	do 
		printf "|---|"
	done
		printf "\n"
}
initial

echo "Player 1 Name :"
read player1

echo "Player 2 Name :"
read player2

echo "$player1 Enter Your Logo ( X | O )"
read logo1

board[0]=logo1
display
printf "\n"

if (( logo1=="X" || logo1=="x" ))
then 
	logo2="Y"
else
	logo2="X"
fi
echo "B is ( X | Y )"

board[0]="B"
display

clear

printf "\n"

step1=0
step2=0
turn1=0
turn2=0
flag1=0
flag2=0
Before1=0
Before2=0

for (( ; ; ))
do
	echo "$player1 Turn (Enter)"
	read A
	turn1=$(($RANDOM%6+1))
	echo "$player1 Dice is :$turn1"
	
	if (($step1==0))
	then
		board[0]=$logo2
	fi
		

	step1=$(($step1+$turn1))
	
	if (($step1>100))
	then
		step1=$(($step1-$turn1))
	fi
	
	board[$(($step1-$turn1))]=0

	board[$(($step1-1))]=$logo1	
	
	display
        
	printf "\n"
        
        if (( $step1 == 100 ))
	then
		flag1=1
		break
	fi
		

	echo "$player2 Turn (Enter)"
	read B

	turn2=$(($RANDOM%6+1))
	echo "$player2 Dice is :$turn2"
	
	step2=$(($step2+$turn2))	
	
		
	if (($step2>100))
	then
		step2=$(($step2-$turn2))
	fi	
		
	board[$(($step2-turn2))]=0

	if (( $step1 == $step2 ))
	then
		board[$step1-1]="B"
	else
		board[$step2-1]=$logo2	
	fi	
	
	echo "B is (X | Y)"
	
	display     
	
	printf "\n"
	  
	if (( $step2 == 100 ))
	then
		flag2=1
		break
	fi
	
	board[0]=0
done


	if (( $flag1==1 ))
	then
		echo "$player1 Win The game"
	else
		echo "$player2 Win The Game"
	fi
