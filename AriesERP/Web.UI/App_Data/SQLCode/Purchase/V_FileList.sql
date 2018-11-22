(--V_FileList  
SELECT b.FileName,a.FtpIDKey,a.rkey28,  
b.IDKey,b.Ftp_Ptr,b.FtpDir,b.Ftp_fileName,b.UploadTime,b.UploadUser_d05ptr,b.GroupIDKey,b.BEnable  
FROM Data0028_FileList  a   
inner join  Tier3_CustomerFiles  b on a.FtpIDKey = b.IDKey
union 
select '','',-1,'','','','','',0,'',0
)a