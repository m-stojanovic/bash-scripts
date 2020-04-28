BEGIN {
	title="AWK";
	print "<html>\n<title>"title"</title><body bgcolor=\"#ffffff\">\n<table border=1><th  colspan=2 align=centre>Student Details</th>";
}
{
	name=$1;
	rollno=$2;
	print "<tr><td>"name"</td><td>"rollno"</td></tr>";
}
END {
    print "</table></body>\n</html>";
}
