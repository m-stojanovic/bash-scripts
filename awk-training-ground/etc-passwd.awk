BEGIN {
	FS=":";
	print "Name\tUserID\tGroupID\tHomeDir";
	line=0;
}
{
	print $1"\t"$2"\t"$3"\t"$NF;
}
END {
	print NR,"Records processes";
}
