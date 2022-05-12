#!/bin/bash

cd $HOME/lammps-29Sep2021/examples/colloid

flag=0
plot=""

m=(1 10 100)

for i in ${m[@]}
do
	echo "variable m equal $i" > in.colloid.$i
	cat in.colloid >> in.colloid.$i
	$HOME/lmp -in in.colloid.$i
	rm in.colloid.$i

	if [[ $flag -eq 0 ]]
	then
		plot="plot \"out.$i\" with lines"
		flag=1
	else
		plot=$plot", \"out.$i\" with lines"
	fi
done

echo $plot

cat in.gnuplot > in.gnuplot.tmp
echo "set output \"out.gif\"" >> in.gnuplot.tmp
echo $plot >> in.gnuplot.tmp
gnuplot in.gnuplot.tmp
rm  in.gnuplot.tmp


for i in ${m[@]}
do
	rm out.$i
done
