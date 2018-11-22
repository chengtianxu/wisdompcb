unit udm;

interface

uses
  SysUtils, Classes, ADODB, DB, Windows, Forms, ExeImage,
  IdHashMessageDigest, TlHelp32, ZLib;



type
  TColPrograms=(ColPKP,ColVerText,ColPName,ColPPath, ColLastImportDate);
  TColFileList=(ColPKF,ColFileSize,ColFileName,ColFromPath,ColImported,ColLastAccTime,ColFileHash);
  TColdata=(ColPKD,ColFromFile,ColHash,ColUpdateed,ColActionDate,ColLine);

  TPGids= array of Integer;
  TStatCount = array [Boolean] of Integer;
  TOneData= record
    hash:array [0..31] of Char;
    datestr:array [0..9] of Char;
    strline:string[255];
  end;

  Tdm = class(TDataModule)
    aconn: TADOConnection;
    aqry: TADOQuery;
    statqry: TADOQuery;
    odataqry: TADOQuery;
    fstatqry: TADOQuery;
    procedure DataModuleCreate(Sender: TObject);
    procedure statqryBeforeClose(DataSet: TDataSet);
    procedure odataqryBeforeClose(DataSet: TDataSet);
  private
    { Private declarations }
    function insertpg( vertext,pname,ppath,phash:string; lastinportdate:tdatetime):Boolean;
    function insertfl(filesize:Int64;filename:string;formpath:Integer;imported:boolean;
                      lastacctime:TDateTime;filehash:string):Boolean;
    function insertdt(fromfile:Integer;hash:string;actiondate:string;linestr:string):Boolean;

    function uncheckfilelist(fid:Integer;sr:TSearchRec):Boolean;

    function listpgids(var arr:Tpgids):Integer;

    function hasFile(frompg:Integer;filename:string):Integer;
    function hasPG(hash:string):Integer;
    function checkfileimport(fid:Integer;imported:Boolean):Boolean;

    function getFInfoByID(fileid:integer;col:TColFileList):string;
    function checkfile(sr:TSearchRec; parent:Integer):Boolean;
    function getPInfoByID(programid:integer;col:TColPrograms):string;
    function findWin(incluetext:string):THandle;


  public
    { Public declarations }
    function getVer(filename:string):string;
    procedure recordProgram(filepath,vertext:string);
    procedure readDataFile(sr:TSearchRec;fid:Integer);
    function  addFileToList(programid:integer;sr:TSearchRec):Boolean;
    function getRunProg:Integer;
    procedure mainstarter;
    function md5(str:string):string;
    function FileTimeToDateTime(ft:TFileTime):TDateTime;

    function gettopdata(var data: TOneData):Boolean;
    procedure updatefilestat;

    procedure createdb(dbpath:string);
  end;
resourcestring

  dbname='data.mdb';
  cnpath='TestRecords\';

var
  dm: Tdm;
  status: Tstatcount;

implementation

{$R *.dfm}

{$R dbf.res}

function Tdm.findwin(incluetext: string): THandle;
var
  t:array [0..255] of Char;
begin
  Result:=GetWindow(Application.Handle,GW_HWNDFIRST);
  while Result >0 do
  begin
    if GetWindowText(Result,t,256)>0 then
    if Pos(incluetext,t)>0 then
    Exit;
    Result:=GetWindow(Result,GW_HWNDNEXT);
  end;
end;

function Tdm.getver(filename: string): string;
const
  allowchar=['0'..'9','.'];
var
  i,p:Integer;
  data:array [0..255] of WideChar;
begin
  FillChar(data,SizeOf(data),#0);
  with  TExeImage.CreateImage(Self,FileName), TFileStream.Create(FileName,fmShareDenyNone) do
  begin
    p:=0;
    for i:=1 to Resources.Count do
    if Resources[i-1].Name='Version' then
    begin
      with TResourceItem(Resources[i]).list[0] do
      p:=Offset+Size+2;
      Break;
    end;
    if p>0 then
    begin
      Seek(p,soBeginning);
      Read(i,2);
      Read(data,i);
    end;
  end;
  Result:=data;
  result:=copy(Result,Pos('v',Result)+1,4);
  for i:=Length(result)  downto 1 do
  if not (result[i] in allowchar) then
  Delete(result,i,1);
end;



procedure Tdm.recordprogram(filepath, vertext: string);
var
  hashstr:string;
begin
  hashstr:=md5(filepath+vertext);
  if  haspg(hashstr)=0 then
  insertpg(vertext,ExtractFileName(filepath),ExtractFilePath(filepath),
          hashstr,EncodeDate(2000,1,1));
end;

function Tdm.insertpg(vertext, pname, ppath, phash: string;
  lastinportdate: tdatetime): Boolean;
var
  dtstr:string;
begin
  DateTimeToString(dtstr,'yyyy-MM-dd HH:mm:ss',lastinportdate);
  with aqry do
  begin
    SQL.Clear;
    SQL.Add(Format('insert into programs ( vertext,pname, ppath,phash,lastimportdate) '+
                   'values ( ''%s'', ''%s'', ''%s'', ''%s'' , format(''%s'',''yyyy-MM-dd HH:mm:ss''))',
            [vertext, pname, ppath, phash, dtstr]));

    try
      Result:=ExecSQL>0;
    except
      Result:=False;
    end;
    Close;
  end;
end;

procedure Tdm.DataModuleCreate(Sender: TObject);
var
  db:string;
begin
  db:=ExtractFilePath(Application.ExeName)+'\data.mdb';
  createdb(db);
  aconn.ConnectionString:=aconn.ConnectionString+db;
  aconn.Connected:=True;

end;

function Tdm.haspg(hash: string): Integer;
begin
  with aqry do
  begin
    SQL.Clear;
    sql.Add(Format('select ID from programs where phash = ''%s'' ',[hash]));
    try
      Open;
      if RecordCount>0 then
        Result:=Fields.Fields[0].AsInteger
      else
        Result:=0;
    except
      Result:=0;
    end;
    Close;
  end;
end;

function Tdm.getrunprog: Integer;
var
  i,pid,ss:Cardinal;
  stat:Boolean;
  me:MODULEENTRY32;
  fpath,vtext:string;
  ver:Double;
begin
  stat:=False;
  Result:=0;
  i:=findwin('宇之光飞针 FlyProber');
  if i>0 then
  begin
    GetWindowThreadProcessId(i,pid);
    if pid>0 then
    begin
      ss:=CreateToolhelp32Snapshot(TH32CS_SNAPMODULE,pid);
      me.dwSize:=sizeof(me);
      if Module32First(ss,me) then
      begin
        fpath:=me.szExePath;
        vtext:=getver(fpath);
        if TryStrToFloat(vtext,ver) then
        if ver>3.7999 then
        stat:=True;
        if stat then recordprogram(fpath,FloatToStr(ver));
        Tag:=hasPG(md5(fpath+vtext));
      end;
    end;
  end;
  if not stat then
  begin
    if ver>3.8 then
    //
    Result:=-1;
    if fpath='' then
    //tray.ShowBalloonHint('注意','请确认已经打开并登录了飞测测试程序',bhiWarning);
    Result:=-2;
  end
  else
    Result:=tag;

end;

procedure Tdm.mainstarter;
procedure putfiles(pgid:integer);
const
  filefilter='*.txt';
  cnpath='TestRecords\';
var
  progpath:string;

  sr:TSearchRec;
  fres:Boolean;
begin
  progpath:=getPInfoByID(pgid,ColPPath);
  fres:= FindFirst(progpath+cnpath+filefilter, faAnyFile ,sr)=0;
  while fres do
  begin
    if (sr.Attr and faDirectory)<>faDirectory then
    begin
      if checkfile(sr,pgid) then
      try
        DeleteFile(PChar(progpath+cnpath+sr.name));
      except
        OutputDebugString('delete error');
      end;
    end;
    fres:=FindNext(sr)=0;
  end;
end;
var
  ids: Tpgids;
  i:Integer;
begin
  SetLength(ids,0);
  listpgids(ids);
  for i:=0 to length(ids)-1 do
  begin
    putfiles(ids[i]);
  end;
end;

function Tdm.getPInfoByID(programid: integer; col: TColPrograms): string;
begin
  with aqry do
  begin
    Close;
    SQL.Clear;
    SQL.Add(Format('select * from programs where id = %d',[programid]));
    try
      Open;

      if RecordCount>0 then
         Result:=Fields.Fields[Integer(col)].AsString
      else
        Result:='';
    except
      Result:='';
    end;
    Close;
  end;
end;

function Tdm.insertfl(filesize: Int64; filename: string; formpath: Integer;
  imported: boolean; lastacctime: TDateTime; filehash: string): Boolean;
var
  strlastacctime:string;
begin
  DateTimeToString(strlastacctime,'yyyy-MM-dd HH:mm:ss',lastacctime);
  with aqry do
  begin
    Close;
    SQL.Clear;
    SQL.Add(Format('insert into filelist (filesize, filename, frompath, imported,'+
                   ' lastacctime, filehash ) values ( %d , ''%s'' , %d , %s , '+
                   'format(''%s'',''yyyy-MM-dd HH:mm:ss'') , ''%s'' )',
                   [filesize,filename,formpath, BoolToStr(imported,True),
                    strlastacctime, filehash]));
    OutputDebugString(PChar(SQL.Text));
    try
      Result:=ExecSQL>0;
    except
      Result:=False;
    end;
    Close;
  end;
end;




function Tdm.checkfile(sr: TSearchRec; parent: Integer): Boolean;
var
  fid,fsize:Integer;
begin
  fid:=hasFile(parent, sr.Name);
  if fid>0 then
  begin
    fsize:=StrToInt(getFInfoByID(fid,ColFileSize));
    if fsize<>sr.Size then
    uncheckfilelist(fid,sr);
  end
  else
    addFileToList(parent,sr);
  fid:=hasFile(parent,sr.Name);
  Result:=fid>0;
  if not strtobool(getFInfoByID(fid,ColImported)) then
    readDataFile(sr,fid);
end;

function Tdm.getFInfoByID(fileid: integer; col: TColFileList): string;
begin
  with aqry do
  begin
    Close;
    SQL.Clear;
    SQL.Add(Format('select * from filelist where id = %d',[fileid]));
    try
      Open;
      if Recordset.RecordCount>0 then
         Result:=Fields.Fields[Integer(col)].AsString
      else
        Result:='';
    except
      Result:='';
    end;
    Close;
  end;
end;

function Tdm.hasFile(frompg: Integer; filename: string):Integer;
begin
  with aqry do
  begin
    SQL.Clear;
    sql.Add(Format('select ID from filelist where ( frompath = %d ) and ( filename = ''%s'' )  ',[frompg,filename]));
    OutputDebugString(PChar('getidsql:'+SQL.Text));
    try
      Open;
      if RecordCount>0 then
        Result:=fieldbyname('ID').AsInteger
      else
        Result:=0;
    except
      Result:=0;
    end;
    OutputDebugString(PChar('ID='+IntToStr(Fields.Fields[0].AsInteger)));
    Close;
  end;
end;

function Tdm.md5(str: string): string;
begin
  with TIdHashMessageDigest5.Create do
  Result:=AsHex(HashValue(str));
end;

function Tdm.uncheckfilelist(fid: Integer; sr: TSearchRec): Boolean;
var
  strtime:string;
begin
  DateTimeToString(strtime,'yyyy-MM-dd HH:mm:ss',FileTimeToDateTime(sr.FindData.ftLastWriteTime));
  with aqry do
  begin
    Close;
    SQL.Clear;
    SQL.Add(Format('update filelist '+
                   'set imported= false,'+
                   '    filesize= %d ,'+
                   '    filehash= ''%s'' , '+
                   '    lastacctime =  format(''%s'',''yyyy-MM-dd HH:mm:ss'') '+
                   'where id = %d ', [sr.Size,  md5(sr.Name+IntToStr(sr.Size)), strtime, fid]));
    OutputDebugString(PChar(SQL.Text));
    try
      Result:=ExecSQL>0;
    except
      Result:=False;
    end;
    Close;
  end;
end;

function Tdm.FileTimeToDateTime(ft: TFileTime): TDateTime;
var
  systime:TSystemTime;
begin
  FileTimeToSystemTime(ft,systime);
  Result:=SystemTimeToDateTime(systime);
end;

function Tdm.addFileToList(programid: integer; sr: TSearchRec): Boolean;
var
  strmd5:string;
begin
  Result:=True;
  strmd5:=md5(sr.Name+IntToStr(sr.Size));
  if hasFile(programid, sr.Name)=0 then
  Result:=insertfl(sr.Size,sr.Name,programid,False,FileTimeToDateTime(sr.FindData.ftLastWriteTime),strmd5);
end;

procedure Tdm.readDataFile(sr: TSearchRec; fid: Integer);
const
  md5str='D570599CD6EA07C6F2AAB5C00DA223CC';
var
  fstat:Boolean;
  F:TextFile;
  fpath,linestr,filedate:string;
  dtfmt:TFormatSettings;
begin
  fpath:=getPInfoByID(StrToInt(getFInfoByID(fid,ColFromPath)),ColPPath)+cnpath;
  if not FileExists(fpath+sr.Name) then Exit;
  fstat:=StrToBool(getFInfoByID(fid,ColImported));
  filedate:=Copy(sr.Name,1,Pos('.',sr.Name)-1);
  dtfmt.DateSeparator:='-';
  dtfmt.ShortDateFormat:='yyyy-MM-dd';
  if filedate=DateToStr(Now,dtfmt) then Exit;
  if not fstat then
  begin
    AssignFile(F,fpath+sr.Name);
    try
      Reset(F);
      while not Eof(F) do
      begin
        Readln(F,linestr);
        if Length(linestr)>0 then
        begin
          if md5(linestr)=md5str then Continue;
          if Pos(',00:00:00,0,0,0,0,0',linestr)>0 then Continue;
          insertdt(fid,md5(linestr),filedate,linestr);
        end;
      end;
      checkfileimport(fid,True);
      CloseFile(F);
    except
      
    end;
  end; 
end;

function Tdm.insertdt(fromfile: Integer; hash: string;
  actiondate: string; linestr: string): Boolean;
begin
  with aqry do
  begin
    Close;
    SQL.Clear;
    SQL.Add(Format('insert into data (fromfile, hash,actiondate,linestr) '+
                   'values( %d,''%s'',format(''%s'',''yyyy-MM-dd HH:mm:ss''), ''%s'')',
                   [fromfile,hash,actiondate+' 0:00:00',linestr]));
    OutputDebugString(PChar(SQL.Text));
    try
      Result:=ExecSQL>0;
    except
      Result:=False;
    end;
    Close;
  end;

end;

function Tdm.checkfileimport(fid: Integer; imported: Boolean): Boolean;
begin
  with aqry do
  begin
    Close;
    sql.Clear;
    SQL.Add(Format('update filelist set imported = %s where id = %d ',
                   [BoolToStr(imported,True),fid]));
    try
      Result:=ExecSQL>0;
    except
      Result:=False;
    end;
  end;
end;

function Tdm.listpgids(var arr: Tpgids): Integer;
begin
  with aqry do
  begin
    Close;
    sql.Clear;
    SQL.Add(' SELECT ID from programs ');
    try
      Open;
      First;
      while not Eof do
      begin
        SetLength(arr,Length(arr)+1);
        arr[High(arr)]:=Fields.Fields[0].AsInteger;
        Next;
      end;
      Result:=Length(arr);
    except
      Result:=0;
    end;
  end;
end;

procedure Tdm.statqryBeforeClose(DataSet: TDataSet);
begin
  FillChar(status,SizeOf(status),0);
  with DataSet do
  if Active then
  while not Eof do
  begin
    status[Fields[0].AsBoolean]:=Fields[1].AsInteger;
    Next;
  end;

end;

function Tdm.gettopdata(var data: TOneData):Boolean;
begin
  Result:=False;
  with odataqry do
  begin
    try
      Open;
      Result:=Recordset.RecordCount>0;
      if Result then
      begin
        First;
        CopyMemory(@(data.hash),PChar(Fields.Fields[1].AsString),32);
        CopyMemory(@(data.datestr),PChar(Fields.Fields[2].AsString),10);
        //CopyMemory(@(data.strline),PChar(Fields.Fields[1].AsString),Length(Fields.Fields[1].AsString));
        data.strline:=Fields.Fields[3].AsString;
      end;
    except
      FillChar(data,SizeOf(Result),0);
    end;

  end;

end;

procedure Tdm.odataqryBeforeClose(DataSet: TDataSet);
begin
  if odataqry.Tag=10 then Exit;
  with DataSet do
  if RecordCount>0 then
  begin
    Edit;
    Fields[0].AsBoolean:=True;
    Post;
  end;

end;

procedure Tdm.updatefilestat;
begin

end;

procedure Tdm.createdb(dbpath:string);
var
  ds:TDecompressionStream;
  ms:TMemoryStream;
  rs:TResourceStream;
  s:Integer;
begin
  if not FileExists(dbpath) then
  begin
    rs:=TResourceStream.Create(HInstance,'db','dbfile');
    rs.Position:=0;
    rs.ReadBuffer(s,SizeOf(s));
    ds:=TDecompressionStream.Create(rs);
    ms:=TMemoryStream.Create;
    ms.SetSize(s);
    ds.Read(ms.memory^,s);
    ms.SaveToFile(dbpath);
    ds.Free;
    ms.Free;
    rs.Free;
  end;
end;

end.
