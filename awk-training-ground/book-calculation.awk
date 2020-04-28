BEGIN {
	total = 0;
}
{
itemno=$1;
book=$2;
bookamount=$4*$3;
total=total+bookamount;
print itemno," ", book,"\t","$"bookamount;
}
END { 
	print "total_amount=$"total;
}
