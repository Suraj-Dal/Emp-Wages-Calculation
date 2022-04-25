#!/bin/bash -x

isPartTime=1
isFullTime=2
randomCheck=$((RANDOM%3))
empRatePerHr=20

case $randomCheck in
			$isPartTime )
				empHrs=4
			;;
			$isFullTime )
				empHrs=8
			;;
			*)
				empHrs=0
			;;
esac
salary=$(($empHrs*$empRatePerHr))
echo "Salary of Employee for the Day is :" $salary
