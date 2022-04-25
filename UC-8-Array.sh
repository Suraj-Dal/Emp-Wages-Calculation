#!/bin/bash -x

isPartTime=1
isFullTime=2
maxHrsInMonth=100
empRatePerHr=20
NumOfWorkingDays=20

totalEmpHr=0
totalWorkingDays=0

function getWorkingHrs()
{
	case $1 in
			$isPartTime )
				empHrs=4
			;;
			$isFullTime )
				empHrs=8
			;;
			*)
				empHrs=0
	esac
}

function getSalary()
{
	echo $(($totalEmpHr*$empRatePerHr))
}

while [[ $totalEmpHr -lt $maxHrsInMonth && $totalWorkingDays -lt $NumOfWorkingDays ]]
do
	((totalWorkingDays++))
	randomCheck=$((RANDOM%3))
	getWorkingHrs $randomCheck
	totalEmpHr=$(($totalEmpHr+$empHrs))
	dailyWages[$totalWorkingDays]=$(($empHrs*$empRatePerHr))
done

totalSalary="$(getSalary $totalEmpHr)"
echo "${dailyWages[@]}"
