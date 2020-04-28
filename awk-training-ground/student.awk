BEGIN {
	total_test1=0;
	total_test2=0;
	total_test3=0;
	print "Name\tRollNo\t Average Score";
}
{
	total=$3+$4+$5;
	total_test1=total_test1+$3;
	total_test2=total_test2+$4;
	total_test3=total_test3+$5;
	print $1"\t"$2"\t",total/3;

}
END {
	print "Avarage of test1 is: "total_test1/NR;
	print "Avarage of test2 is: "total_test2/NR;
	print "Avarage of test3 is: "total_test3/NR;
}

