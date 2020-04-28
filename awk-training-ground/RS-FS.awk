BEGIN {
	FS="\n";
	RS="\n\n";
}
{
	print $1"\t"$2;
}
END {
	print "Finished";
}
