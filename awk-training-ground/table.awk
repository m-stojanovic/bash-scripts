BEGIN {
	print "Num\tDescription\tType\tPrice\tQty";
	print "-----------------------------------------------------";
	FS=",";
}
{
	print $1,"\t",$2,"\t",$3,"\t",$4,"\t",$5;
}
END {
	print "finished!"
}
