BEGIN {
	quantity=0;
	price=0;
	FS=",";
}
{
	quantity=$5 - 1;
	$5=quantity;
	price=$4 - $4*0.20;
	$4=price;
	print "New price is "$4" and new quantity is " $5;
}
END {
	print "Finsihed";
}
