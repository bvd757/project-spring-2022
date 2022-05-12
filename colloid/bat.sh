#!/bin/bash

echo "Enter atom's mass"
read -a m

for i in ${m[@]}
do
	echo "variable m equal $i" > in.colloid.$i
	cat in.colloid >> in.colloid.$i
	echo "#!/bin/sh" > in.batch.$i
	echo "#SBATCH -D" $HOME/lammps-29Sep2021/examples/colloid >> in.batch.$i
	echo "#SBATCH -o %j.out" >> in.batch.$i
	echo "#SBATCH -e %j.err" >> in.batch.$i
	echo "$HOME/lmp -in in.colloid.$i" >> in.batch.$i
	cat in.gnuplot > in.gnuplot.$i
	echo "set output \"out$i.gif\"" >> in.gnuplot.$i
	echo "plot \"out.$i\" with lines" >> in.gnuplot.$i
	chmod +x in.batch.$i
	sbatch in.batch.$i
done
