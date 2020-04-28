BEGIN {
	FS=",";
	OFS=":";
	ORS="\n---\n";
}
{
	print $2,$3;
}
