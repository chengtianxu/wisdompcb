(
select a.rec_no,a.rkey595,a.rkey593,b.invt_ttyename,b.rkey593 as prkey593,c.sufchar from data0596 a inner join DATA0593 b on a.rkey593=b.rkey
inner join data0595 c on a.rkey595=c.rkey
) a