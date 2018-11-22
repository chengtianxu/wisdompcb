using System;
using System.Collections.Generic;
using System.Configuration;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Net;
using System.Text;
using System.Web;
using System.Web.UI.HtmlControls;

namespace Aries.Core.Helper
{
    public class FtpHelper
    {
        string Filetype = ConfigurationManager.AppSettings["FileType"];
        string ipaddress = ConfigurationManager.AppSettings["IPaddress"];
        string Username = ConfigurationManager.AppSettings["UserName"];
        string Password = ConfigurationManager.AppSettings["Password"];
        /// <summary>
        /// FTP上传文件
        /// </summary>
        /// <param name="filename">上传文件路径</param>
        /// <param name="ftpServerIP">FTP服务器的IP和端口</param>
        /// <param name="ftpPath">FTP服务器下的哪个目录</param>
        /// <param name="ftpUserID">FTP用户名</param>
        /// <param name="ftpPassword">FTP密码</param>
        public bool Upload(string filename, string ftpServerIP, string ftpPath, string ftpUserID, string ftpPassword)
        {
            FileInfo fileInf = new FileInfo(filename);
            string uri = "ftp://" + ftpServerIP + "/" + ftpPath + "/" + fileInf.Name;
            try
            {
                FtpWebRequest reqFTP = (FtpWebRequest)FtpWebRequest.Create(new Uri(uri));
                // ftp用户名和密码
                reqFTP.Credentials = new NetworkCredential(ftpUserID, ftpPassword);
                reqFTP.KeepAlive = false;
                // 指定执行什么命令
                reqFTP.Method = WebRequestMethods.Ftp.UploadFile;
                // 指定数据传输类型
                reqFTP.UseBinary = true;
                // 上传文件时通知服务器文件的大小
                reqFTP.ContentLength = fileInf.Length;
                //this.Invoke(InitUProgress, fileInf.Length);
                // 缓冲大小设置为2kb
                int buffLength = 4096;
                byte[] buff = new byte[buffLength];
                int contentLen;
                // 打开一个文件流 (System.IO.FileStream) 去读上传的文件
                FileStream fs = fileInf.OpenRead();
                // 把上传的文件写入流
                Stream strm = reqFTP.GetRequestStream();
                contentLen = fs.Read(buff, 0, buffLength);
                while (contentLen != 0)
                {
                    strm.Write(buff, 0, contentLen);
                    contentLen = fs.Read(buff, 0, buffLength);
                }
                // 关闭两个流
                strm.Close();
                strm.Dispose();
                fs.Close();
                fs.Dispose();
                return true;
            }
            catch (Exception ex)
            {
                return false;
            }
        }
        /// <summary>
        /// 新建目录
        /// </summary>
        /// <param name="ftpPath"></param>
        /// <param name="dirName"></param>
        public void MakeDir(string ftpPath, string dirName, string username, string password)
        {
            try
            {
                //实例化FTP连接
                FtpWebRequest request = (FtpWebRequest)FtpWebRequest.Create(new Uri(ftpPath + dirName));
                // ftp用户名和密码
                request.Credentials = new NetworkCredential(username, password);
                // 默认为true，连接不会被关闭
                request.KeepAlive = false;
                //指定FTP操作类型为创建目录
                request.Method = WebRequestMethods.Ftp.MakeDirectory;
                //获取FTP服务器的响应
                FtpWebResponse response = (FtpWebResponse)request.GetResponse();
                response.Close();
            }
            catch (Exception ex)
            {
                //Respons
            }
        }
        /// <summary>
        /// 删除指定文件
        /// </summary>
        /// <param name="ftpPath"></param>
        /// <param name="dirName"></param>
        /// <param name="username"></param>
        /// <param name="password"></param>
        public void DeleteFile(string ftpPath, string username, string password)
        {
            try
            {
                //实例化FTP连接
                FtpWebRequest request = (FtpWebRequest)FtpWebRequest.Create(new Uri(ftpPath));
                request.Method = WebRequestMethods.Ftp.DeleteFile;
                // ftp用户名和密码
                request.Credentials = new NetworkCredential(username, password);
                // 默认为true，连接不会被关闭
                request.KeepAlive = false;
                //获取FTP服务器的响应
                FtpWebResponse response = (FtpWebResponse)request.GetResponse();
                response.Close();
            }
            catch (Exception ex)
            {
                //Respons
            }
        }
        /// <summary>
        /// 检查目录是否存在
        /// </summary>
        /// <param name="ftpPath">要检查的目录的路径</param>
        /// <param name="dirName">要检查的目录名</param>
        /// <returns>存在返回true，否则false</returns>
        public bool CheckDirectoryExist(string ftpPath, string dirName, string username, string password)
        {
            bool result = false;
            try
            {
                //实例化FTP连接
                FtpWebRequest request = (FtpWebRequest)FtpWebRequest.Create(new Uri(ftpPath));
                // ftp用户名和密码
                request.Credentials = new NetworkCredential(username, password);
                request.KeepAlive = false;
                //指定FTP操作类型为创建目录
                request.Method = WebRequestMethods.Ftp.ListDirectoryDetails;
                //获取FTP服务器的响应
                FtpWebResponse response = (FtpWebResponse)request.GetResponse();
                StreamReader sr = new StreamReader(response.GetResponseStream(), Encoding.Default);
                StringBuilder str = new StringBuilder();
                string line = sr.ReadLine();
                while (line != null)
                {
                    str.Append(line);
                    str.Append("|");
                    line = sr.ReadLine();
                }
                string[] datas = str.ToString().Split('|');
                for (int i = 0; i < datas.Length; i++)
                {
                    if (datas[i].Contains("<DIR>"))
                    {
                        int index = datas[i].IndexOf("<DIR>");
                        string name = datas[i].Substring(index + 5).Trim();
                        if (name == dirName)
                        {
                            result = true;
                            break;
                        }
                    }
                    else
                    {
                        if (datas[i].Trim().Substring(0, 1).ToUpper() == "D")
                        {
                            string name = datas[i].Substring(55).Trim();
                            if (name == dirName)
                            {
                                result = true;
                                break;
                            }
                        }
                    }

                }
                sr.Close();
                sr.Dispose();
                response.Close();
            }
            catch (Exception)
            {
                return false;
            }
            return result;
        }
        /// <summary>
        /// 上传文件
        /// </summary>
        /// <param name="buffer">文件的Byte数组</param>
        /// <param name="originalName">文件原始名字(带后缀名)</param>
        /// <param name="perStr">新文件名的前缀</param>
        /// <returns></returns>
        public string UpFile(byte[] buffer, string originalName, string perStr = "")
        {
            if (buffer == null || buffer.Length <= 0 || string.IsNullOrEmpty(originalName))
                throw new ArgumentException("参数错误！");
            string filePathstr = string.Empty;
            string filepathsql = null;  
            try
            {
                string pathstr = perStr + DateTime.Now.ToString().Replace("/", "").Replace("-", "").Replace(":", "").Replace(" ", "");
                string rodumlist = GetMixPwd(10);//10位随机数
                filePathstr = "~/File/" + pathstr + rodumlist + Path.GetExtension(originalName);
                //Stream sr = upfile.PostedFile.InputStream;
                //byte[] file = new byte[sr.Length];
                //sr.Read(file, 0, file.Length);
                StreamWriter sw = new StreamWriter(HttpContext.Current.Server.MapPath(filePathstr));
                sw.BaseStream.Write(buffer, 0, buffer.Length);
                sw.Flush(); sw.Close();
                // file.SaveAs(HttpContext.Current.Server.MapPath(filePathstr));//把文件上传到服务器的绝对路径上
                bool check;
                string ftpPath = DateTime.Now.ToString("yyyy-MM-dd");
                string uri = @"ftp://" + ipaddress + "/";
                //检查是否存在此目录文件夹
                if (CheckDirectoryExist(uri, ftpPath, Username, Password))
                {
                    //存在此文件夹就直接上传
                    check = Upload(HttpContext.Current.Server.MapPath(filePathstr), ipaddress, ftpPath, Username, Password);
                }
                else
                {
                    MakeDir(uri, ftpPath, Username, Password);//创建
                    check = Upload(HttpContext.Current.Server.MapPath(filePathstr), ipaddress, ftpPath, Username, Password);
                }
                //成功就更新
                if (check)
                {
                    filepathsql = ftpPath + "/" + pathstr + rodumlist + Path.GetExtension(originalName);
                }
                //检查是否存在此文件
                if (File.Exists(HttpContext.Current.Server.MapPath(filePathstr)))
                {
                    File.Delete(HttpContext.Current.Server.MapPath(filePathstr));
                }
                return filepathsql;
            }
            catch (Exception ex)
            {
                File.Delete(HttpContext.Current.Server.MapPath(filePathstr));
                throw ex;
            }
        }
        /// <summary>
        /// 上传文件
        /// 不修改名字及后缀名
        /// </summary>
        /// <param name="originalFilePath">上传文件的绝对路径</param>
        /// <returns></returns>
        public string UpFile(string originalFilePath)
        {
            if (string.IsNullOrEmpty(originalFilePath))
                throw new ArgumentException("参数错误！");
            string filepathsql = null;
            try
            {
                //检查是否存在此文件
                if (!File.Exists(originalFilePath))
                    throw new Exception("文件不存在！");
                //Stream sr = upfile.PostedFile.InputStream;
                //byte[] file = new byte[sr.Length];
                //sr.Read(file, 0, file.Length);
                // file.SaveAs(HttpContext.Current.Server.MapPath(filePathstr));//把文件上传到服务器的绝对路径上
                bool check;
                string ftpPath = DateTime.Now.ToString("yyyy-MM-dd");
                string uri = @"ftp://" + ipaddress + "/";
                //检查是否存在此目录文件夹
                if (CheckDirectoryExist(uri, ftpPath, Username, Password))
                {
                    //存在此文件夹就直接上传
                    check = Upload(originalFilePath, ipaddress, ftpPath, Username, Password);
                }
                else
                {
                    MakeDir(uri, ftpPath, Username, Password);//创建
                    check = Upload(originalFilePath, ipaddress, ftpPath, Username, Password);
                }
                //成功就更新
                if (check)
                {
                    filepathsql = ftpPath + "/" + Path.GetFileName(originalFilePath);
                }
                //检查是否存在此文件
                if (File.Exists(originalFilePath))
                {
                    File.Delete(originalFilePath);
                }
                return filepathsql;
            }
            catch (Exception ex)
            {
                //File.Delete(originalFilePath);
                throw ex;
            }
        }
        public string Ftp_Up(HtmlInputFile upfile)
        {
            //Encrypt En = new Encrypt();
            string filePathstr = string.Empty;
            string filepathsql = null;
            try
            {
                string pathstr = DateTime.Now.ToString().Replace("/", "").Replace("-", "").Replace(":", "").Replace(" ", "");
                string rodumlist = GetMixPwd(10);//10位随机数
                filePathstr = "~/File/" + pathstr + rodumlist + Path.GetExtension(upfile.PostedFile.FileName);
                Stream sr = upfile.PostedFile.InputStream;
                byte[] file = new byte[sr.Length];
                sr.Read(file, 0, file.Length);
                StreamWriter sw = new StreamWriter(HttpContext.Current.Server.MapPath(filePathstr));
                sw.BaseStream.Write(file, 0, file.Length);
                sw.Flush(); sw.Close(); sr.Flush(); sr.Close();
                // file.SaveAs(HttpContext.Current.Server.MapPath(filePathstr));//把文件上传到服务器的绝对路径上
                bool check;
                string ftpPath = DateTime.Now.ToString("yyyy-MM-dd");
                string uri = @"ftp://" + ipaddress + "/";
                //检查是否存在此目录文件夹
                if (CheckDirectoryExist(uri, ftpPath, Username, Password))
                {
                    //存在此文件夹就直接上传
                    check = Upload(HttpContext.Current.Server.MapPath(filePathstr), ipaddress, ftpPath, Username, Password);
                }
                else
                {
                    MakeDir(uri, ftpPath, Username, Password);//创建
                    check = Upload(HttpContext.Current.Server.MapPath(filePathstr), ipaddress, ftpPath, Username, Password);
                }
                //成功就更新
                if (check)
                {
                    filepathsql = ftpPath + "/" + pathstr + rodumlist + Path.GetExtension(upfile.PostedFile.FileName);
                }
                //检查是否存在此文件
                if (File.Exists(HttpContext.Current.Server.MapPath(filePathstr)))
                {
                    File.Delete(HttpContext.Current.Server.MapPath(filePathstr));
                }
                return filepathsql;
            }
            catch (Exception)
            {
                File.Delete(HttpContext.Current.Server.MapPath(filePathstr));
                return filepathsql;
                // Response.Write("<script>alert(" + ex.Message + ");</script>");
            }
        }
        /// <summary>
        /// 上传
        /// </summary>
        /// <param name="file"></param>
        /// <returns></returns>
        public string Ftp_Up(HttpPostedFileBase postedFile)
        {
            string filePathstr = string.Empty;
            string filepathsql = null;
            try
            {
                string pathstr = DateTime.Now.ToString("yyyyMMddHHmmss");
                string rodumlist = GetMixPwd(10);//10位随机数
                string filename = System.IO.Path.GetFileName(postedFile.FileName);
                string eExtension = Path.GetExtension(filename);
                string strLocation = HttpContext.Current.Server.MapPath("~/File/");
                filePathstr = strLocation + pathstr + rodumlist + eExtension;
                postedFile.SaveAs(filePathstr);
                bool check;
                string ftpPath = DateTime.Now.ToString("yyyy-MM-dd");
                string uri = @"ftp://" + ipaddress + "/";
                //检查是否存在此目录文件夹
                if (CheckDirectoryExist(uri, ftpPath, Username, Password))
                {
                    //存在此文件夹就直接上传
                    check = Upload(filePathstr, ipaddress, ftpPath, Username, Password);
                }
                else
                {
                    MakeDir(uri, ftpPath, Username, Password);//创建
                    check = Upload(filePathstr, ipaddress, ftpPath, Username, Password);
                }
                //成功就更新
                if (check)
                {
                    filepathsql = ftpPath + "/" + pathstr + rodumlist + eExtension;
                }
                //检查是否存在此文件
                if (File.Exists(filePathstr))
                {
                    File.Delete(filePathstr);
                }
                return filepathsql;
            }
            catch (Exception ex)
            {
                //检查是否存在此文件
                if (File.Exists(filePathstr))
                {
                    File.Delete(filePathstr);
                }
                return "";
                // Response.Write("<script>alert(" + ex.Message + ");</script>");
            }
        }
        /// <summary>
        /// FTP上传
        /// </summary>
        /// <param name="postedFile"></param>
        /// <param name="ftpServerIP"></param>
        /// <param name="ftpPath"></param>
        /// <param name="ftpUserID"></param>
        /// <param name="ftpPassword"></param>
        /// <returns></returns>
        public static string Ftp_Upload(HttpPostedFile postedFile, string ftpServerIP, string ftpPath, string ftpUserID, string ftpPassword) {
            return new FtpHelper().Ftp_Up(postedFile, ftpServerIP, ftpPath, ftpUserID, ftpPassword);
        }
        private string Ftp_Up(HttpPostedFile postedFile, string ftpServerIP, string ftpPath, string ftpUserID, string ftpPassword)
        {
            string filePathstr = string.Empty;
            string filepathsql = null;
            try
            {
                string rodumlist = '{' + System.Guid.NewGuid().ToString().ToUpper() + '}';//guid
                string filename = System.IO.Path.GetFileName(postedFile.FileName);
                string eExtension = Path.GetExtension(filename);
                string strLocation = HttpContext.Current.Server.MapPath("~/File/");
                filePathstr = strLocation + rodumlist;//+ eExtension
                postedFile.SaveAs(filePathstr);
                bool check;
                string uri = @"ftp://" + ftpServerIP + "/";
                if (ftpPath.StartsWith("/")){ftpPath=ftpPath.Substring(1);}
                if (ftpPath.EndsWith("/")) { ftpPath = ftpPath.Substring(0,ftpPath.Length-1); }
                //检查是否存在此目录文件夹(对于子文件夹需要循环调用判断,影响性能暂不用)
                //if (CheckDirectoryExist(uri, ftpPath, ftpUserID, ftpPassword))
                //{
                //    //存在此文件夹就直接上传
                //    check = Upload(filePathstr, ftpServerIP, ftpPath, ftpUserID, ftpPassword);
                //}
                //else
                //{
                MakeDir(uri, ftpPath, ftpUserID, ftpPassword);//创建文件夹
                check = Upload(filePathstr, ftpServerIP, ftpPath, ftpUserID, ftpPassword);
                //}
                //成功就更新
                if (check)
                {
                    filepathsql = rodumlist;
                }
                //检查是否存在此文件
                if (File.Exists(filePathstr))
                {
                    File.Delete(filePathstr);
                }
                return filepathsql;
            }
            catch (Exception ex)
            {
                //检查是否存在此文件
                if (File.Exists(filePathstr))
                {
                    File.Delete(filePathstr);
                }
                return "";
            }
        }
        /// <summary>
        /// FTP下载文件(返回内存流)
        /// </summary>
        /// <param name="ftp_FileName"></param>
        /// <param name="ftpServerIP"></param>
        /// <param name="ftpPath"></param>
        /// <param name="ftpUserID"></param>
        /// <param name="ftpPassword"></param>
        /// <returns></returns>
        public static MemoryStream Ftp_Download(string ftp_FileName, string ftpServerIP, string ftpPath, string ftpUserID, string ftpPassword)
        {
            if (ftpPath.StartsWith("/")) { ftpPath = ftpPath.Substring(1); }
            if (ftpPath.EndsWith("/")) { ftpPath = ftpPath.Substring(0, ftpPath.Length - 1); }
            string uri = "ftp://" + ftpServerIP + "/" + ftpPath + "/" + ftp_FileName;
            MemoryStream ms = new MemoryStream();
            Stream responseStream = null;
            try
            {
                //创建一个与FTP服务器联系的FtpWebRequest对象
                FtpWebRequest request = (FtpWebRequest)WebRequest.Create(new Uri(uri));
                //request.UseBinary = true;
                //request.UsePassive = false;
                //连接登录FTP服务器
                request.Credentials = new NetworkCredential(ftpUserID, ftpPassword);
                request.KeepAlive = false;
                //设置请求的方法是FTP文件下载
                request.Method = WebRequestMethods.Ftp.DownloadFile;
                //获取一个请求响应对象
                FtpWebResponse response = (FtpWebResponse)request.GetResponse();
                //获取请求的响应流
                responseStream = response.GetResponseStream();

                int buffer_count = 65536;//64K
                byte[] buffer = new byte[buffer_count];
                int size = 0;
                while ((size = responseStream.Read(buffer, 0, buffer_count)) > 0)
                {
                    ms.Capacity += size;
                    ms.Write(buffer, 0, size);
                }
                responseStream.Close();
               
            }
            catch (Exception ex)
            {
                //return ms;
            }
            finally
            {
                if (responseStream != null)
                    responseStream.Close();
            }
            return ms;
        }
        /// <summary>
        /// FTP下载文件在服务器目录
        /// </summary>
        /// <param name="pathname">本地保存目录路径和文件名称</param>
        /// <param name="filename">FTP目录路径和文件名称</param>
        /// <returns></returns>
        public bool FileDown(string pathname, string filename)
        {
            string uri = "ftp://" + ipaddress + "/" + filename;
            string FileName = pathname;//本地保存目录
            //创建一个文件流
            FileStream fs = null;
            Stream responseStream = null;
            try
            {
                //创建一个与FTP服务器联系的FtpWebRequest对象
                FtpWebRequest request = (FtpWebRequest)WebRequest.Create(new Uri(uri));
                //连接登录FTP服务器
                request.Credentials = new NetworkCredential(Username, Password);
                request.KeepAlive = false;
                //设置请求的方法是FTP文件下载
                request.Method = WebRequestMethods.Ftp.DownloadFile;
                //获取一个请求响应对象
                FtpWebResponse response = (FtpWebResponse)request.GetResponse();
                //获取请求的响应流
                responseStream = response.GetResponseStream();
                //判断本地文件是否存在，如果存在，则打开和重写本地文件
                if (File.Exists(FileName))
                    fs = File.Open(FileName, FileMode.Open, FileAccess.ReadWrite);
                //判断本地文件是否存在，如果不存在，则创建本地文件
                else
                {
                    fs = File.Create(FileName);
                }
                if (fs != null)
                {
                    int buffer_count = 65536;
                    byte[] buffer = new byte[buffer_count];
                    int size = 0;
                    while ((size = responseStream.Read(buffer, 0, buffer_count)) > 0)
                    {
                        fs.Write(buffer, 0, size);
                    }
                    fs.Flush();
                    fs.Close();
                    responseStream.Close();
                }
                return true;
            }
            catch (Exception ex)
            {
                return false;
            }
            finally
            {
                if (fs != null)
                    fs.Close();
                if (responseStream != null)
                    responseStream.Close();
            }
        }
        /// <summary>
        /// 保存和上传图片
        /// </summary>
        /// <param name="imgtwo">需要上传图片</param>
        /// <param name="date"></param>
        /// <returns>文件路径</returns>
        public string SaveUploadImg(Bitmap imgtwo)
        {
            string filePathstr = string.Empty;
            string filepathsql = null;
            try
            {
                string pathstr = DateTime.Now.ToString().Replace("/", "").Replace("-", "").Replace(":", "").Replace(" ", "");
                string rodumlist = GetMixPwd(10);//10位随机数
                filePathstr = "~/File/" + pathstr + rodumlist + ".jpg";
                imgtwo.Save(HttpContext.Current.Server.MapPath(filePathstr));//把文件上传到服务器的绝对路径上
                bool check;
                string ftpPath = DateTime.Now.ToString("yyyy-MM-dd");
                string uri = @"ftp://" + ipaddress + "/";
                //检查是否存在此目录文件夹
                if (CheckDirectoryExist(uri, ftpPath, Username, Password))
                {
                    //存在此文件夹就直接上传
                    check = Upload(HttpContext.Current.Server.MapPath(filePathstr), ipaddress, ftpPath, Username, Password);
                }
                else
                {
                    MakeDir(uri, ftpPath, Username, Password);//创建
                    check = Upload(HttpContext.Current.Server.MapPath(filePathstr), ipaddress, ftpPath, Username, Password);
                }
                //成功就更新
                if (check)
                {
                    filepathsql = ftpPath + "/" + pathstr + rodumlist + ".jpg";
                }
                //检查是否存在此文件
                if (File.Exists(HttpContext.Current.Server.MapPath(filePathstr)))
                {
                    File.Delete(HttpContext.Current.Server.MapPath(filePathstr));
                }
                imgtwo.Dispose();
                return filepathsql;
            }
            catch (Exception ex)
            {
                File.Delete(HttpContext.Current.Server.MapPath(filePathstr));
                return filepathsql;
            }
        }
        #region
        /// <summary>
        /// 文件大小
        /// </summary>
        public bool _File_Length(int ContentLength)
        {
            bool length = false;
            int FileLen = ContentLength;
            if (FileLen > 2048 * 1024 == false)//不能超过2M
            {
                length = true;
            }
            return length;
        }
        #endregion
        //用来获取文件类型
        public bool File_PastFileName(string fileName)
        {
            //bmp, doc, docx, gif, jpg, jpeg, pdf, png, tif, tiff
            bool isnot = true;
            string ext = Path.GetExtension(fileName);
            string[] type = Filetype.Split(';');
            for (int i = 0; i < type.Length; i++)
            {
                if (type[i].ToLower() == ext.ToLower())
                {
                    isnot = false;
                    break;
                }
            }
            return isnot;
        }
        /// <summary>
        /// 生成随机数
        /// </summary>
        /// <param name="num"></param>
        /// <returns></returns>
        public static string GetMixPwd(int num)//生成混合随机数
        {
            string a = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ";
            StringBuilder sb = new StringBuilder();
            for (int i = 0; i < num; i++)
            {
                sb.Append(a[new Random(Guid.NewGuid().GetHashCode()).Next(0, a.Length - 1)]);
            }

            return sb.ToString();
        }
    }
}
