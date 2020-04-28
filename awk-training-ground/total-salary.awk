BEGIN {
	FS=",";
	RS="\n";
	total=0;
}
{
	total=total + $NF;
}
END {
	print "Total salary of all employees is $"total
}
