unit uMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, Buttons, StdCtrls, Spin,
  Excel2000,ClipBrd, ComObj,math;

type
  TFMain = class(TForm)
    StG1: TStringGrid;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpinEdit1: TSpinEdit;
    Label1: TLabel;
    //user_ptr: TLabel;
    //db_ptr: TLabel;
    //vpass: TLabel;
    //vprev: TLabel;
    procedure FormActivate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure StG1DblClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure SpinEdit1Change(Sender: TObject);
  private
    { Private declarations }
    hMapFile: THandle;
    MapFilePointer: Pointer;
    function StrToSQL(const pStr:string):string;//将字符串转为可以用SQL语句识别的字符串
    function GetTryclose(const pAcc:string):Currency;
    procedure DisplayExcelFile();
  public
    { Public declarations }
  end;

var
  FMain: TFMain;

implementation

uses uDM,DateUtils, uProgress
,common;

{$R *.dfm}
procedure TFMain.FormCreate(Sender: TObject);
begin
  if not App_Init(dm.conn) then
  begin
    ShowMsg('程序起动失败请联系管理员',1);
    application.Terminate;
  end;
  Caption := application.Title;

  //vprev:='4';
  // rkey73:='4';
  //DM.conn.Open;
  
  DateSeparator := '-';
  ShortDateFormat := 'yyyy-mm-dd';
end;

//获取上期期末余额
function TFMain.GetTryclose(const pAcc:string):Currency;
var
  vSql:string;
  vCurrp,vyear:integer;
begin
//vCurrp:=strtoint(trim(spinedit2.text));
vyear:=strtoint(SpinEdit1.text);

if  vCurrp=1 then
 begin
  vyear:=vyear-1;
  vCurrp:=12;
 end
else
  vCurrp:=vCurrp-1;

   dm.Qry.Close ;
   dm.Qry.SQL.Clear ;
   vSql :='SELECT * FROM Data0110 INNER JOIN';
   vSql:=vSql+' Data0103 ON Data0110.GL_ACCT_PTR = Data0103.RKEY';
   vSql:=vSql+' WHERE (Data0110.FYEAR = '+inttostr(vyear)+') AND ';
   vSql:=vSql+' (Data0103.GL_ACC_NUMBER = '+''''+pAcc+''''+')';

   dm.Qry.SQL.Text :=vSql;

   dm.Qry.Open ;

   if dm.Qry.recordcount>0 then
    begin
      result:=dm.Qry.fieldbyname('TYR_PERIOD_'+inttostr(vCurrp)+'_CLOSE').asCurrency;
    end
   else
    begin
      result:=0;
    end;

end;
//将字符串转为可以用SQL语句识别的字符串
function TFMain.StrToSQL(const pStr:string):string;
var
  vstr1,vstr2,vStr:string;
  vCurr:currency;
  i1,i2,i3,i4:integer;
begin
  //读取一般参数值
  //=ASC("101,D")+ASC("102,D")+ASC("109,D")
  vStr:=ANSIUPPERCASE(pStr);
  while pos('ASC',vStr)>0 do
   begin
    i1:=pos('ASC',vStr);
    i2:=pos('"',copy(vStr,i1,length(vStr)-i1+1));
    i3:=pos(',',copy(vStr,i1,length(vStr)-i1+1));
    i4:=pos('"',copy(vStr,i1+i3,length(vStr)-i1-i3+1));
    vstr1:=copy(copy(vStr,i1,length(vStr)-i1+1),i2+1,i3-i2-1);
    vstr2:=copy(copy(vStr,i1+i3,length(vStr)-i1-i3+1),1,i4-1);

    if trim(vstr1)='' then
     begin
      messagedlg('检查到计算公式'+trim(vStr)+'有错误，科目代码'+vstr1+'不存在！',mtinformation,[mbOk],0);
      exit;
     end;
    if dm.Qry110.Locate('gl_acc_number',trim(vstr1),[]) then
     begin
       vCurr:=dm.Qry110.fieldbyname(vstr2).ascurrency;
     end
    else
     begin
      messagedlg('检查到计算公式'+trim(vStr)+'有错误，取值代码'+vstr2+'不正确！',mtinformation,[mbOk],0);
      result:='';
      exit;
     end;

    vStr:=copy(vStr,1,i1-1)+floattostr(vCurr)+copy(vStr,i1+i3+i4+1,length(vStr)-i1-i3-i4);
   end;
   result:=vStr;
end;
procedure TFMain.FormActivate(Sender: TObject);
//var
 //i:integer;
begin

{
stg1.Cells[0,0]:='报表文件';

dm.Qry524.Open ;

stg1.RowCount:=dm.Qry524.RecordCount+2;

if stg1.RowCount>18 then
 begin
  stg1.ColWidths[0]:=stg1.Width;
 end;

dm.Qry524.DisableControls;
dm.Qry524.First;
for i:=1 to dm.Qry524.RecordCount do
 begin
  stg1.Cells[0,i]:=dm.Qry524.fieldbyname('REPORT_FILE').Value;
  dm.Qry524.Next;
 end;
{}
 end;

procedure TFMain.FormShow(Sender: TObject);
begin

 if not dm.Conn.Connected then
  begin
    application.Terminate ;
  end;


   IF dm.Qry508.Active =false then
   dm.Qry508.Open ;
   spinedit1.MaxValue :=yearof(now);
   spinedit1.text:=DM.Qry508.fieldbyname('curr_FYEAR').asstring;
   spinedit1.SetFocus ;

end;

//打开报表
procedure TFMain.StG1DblClick(Sender: TObject);
var
  vFils,vstr:string;
  vleng:currency;
  i,j,i0,j0:integer;
  XLApp: Variant;
  xlSheet: Variant;
  xlBook:Variant;
begin
 try
  dm.Qry110.Close;
  dm.Qry110.parameters.ParamByName('vYear').Value :=strtoint(spinedit1.text);
  dm.Qry110.open;
  if dm.Qry110.RecordCount =0 then
   begin
    messagedlg('此会计年度没有数据！',mtinformation,[mbok],0);
    exit;
   end;
  Screen.Cursor := crHourGlass;
  if not XLApp=null then
   begin
    XLApp.DisplayAlerts := False;
    XLApp.Quit;
    VarClear(XLApp);
   end;
  xlApp := CreateOleObject('Excel.Application');
  xlApp.Visible := False;
  vFils:=trim(StG1.Cells[0,StG1.Row]);

  vFils:=stringReplace(UpperCase(extractfilepath(paramstr(0))),'EXEC\','KMERP\DATA\',[rfReplaceAll])+vFils;
  xlBook:=xlApp.WorkBooks.Open(vFils);
  xlSheet:=xlApp.WorkSheets[1].Activate;
  xlApp.Cells.SpecialCells(11,EmptyParam).Activate;


      // 要取行数，列数
  i0 := xlApp.ActiveCell.Row;
  j0 := xlApp.ActiveCell.Column;


  Application.CreateForm(TFProgress, FProgress);
  FProgress.show;
  //开始从EXCEL中取数，计算并更新后关闭EXCEL

  for i:=1 to i0 do//最大取值200
   begin
    for j:=1 to j0 do
    begin

      vstr:=trim(xlBook.activesheet.Cells[i,j].formula);
      if vstr<>'' then
       if copy(vstr,1,1)='=' then
        begin
         vstr:=copy(vstr,2,length(vstr)-1);
         vstr:=StrToSQL(vstr);
         if vstr='' then exit;

         vstr:='='+trim(vstr);
         xlBook.activesheet.Cells[i,j].formula:=vstr;
        end;
    end;
    vleng:=int(i/i0*500);
    FProgress.ProgressBar1.Position :=strtoint(floattostr(vleng));
  end;

  vFils:=ExtractFileDir(Application.ExeName);
  for i:=length(vFils) downto 1 do if vFils[i]='\' then break;
  vFils:=copy(vFils,1,i);


  deletefile(vFils+trim(StG1.Cells[0,StG1.Row]));

  XLApp.WorkBooks[1].SaveAs(vFils+trim(StG1.Cells[0,StG1.Row]));
  vFils:=pchar(vFils+trim(StG1.Cells[0,StG1.Row]));
  XlApp.Visible := True;

 FProgress.free;

 Screen.Cursor := crDefault;
 except
   on E: Exception do
     begin
      xlApp.WorkBooks.Close;
      xlApp.Quit;
      Screen.Cursor := crDefault;
      FProgress.free;
      messagedlg(E.Message,mtinformation,[mbok],0);
     end;
 end;
end;
//退出
procedure TFMain.SpeedButton1Click(Sender: TObject);
begin
  FMain.Close ;
end;



procedure TFMain.SpinEdit1Change(Sender: TObject);
begin
  if length(trim(SpinEdit1.Text)) = 4  then
      begin
          DisplayExcelFile ;
      end;
end;

procedure TFMain.DisplayExcelFile;
var
 i:integer;
begin
  stg1.Cells[0,0]:='报表文件';

  if dm.Qry524.Active = false then
      dm.Qry524.Open ;
  dm.Qry524.Filter := 'fyear = ' + SpinEdit1.Text ;

  stg1.RowCount := dm.Qry524.RecordCount + 2;


  if stg1.RowCount > 18 then
      begin
          stg1.ColWidths[0] := stg1.Width;
      end;

  dm.Qry524.DisableControls;
  dm.Qry524.First;
  for i:=1 to dm.Qry524.RecordCount do
      begin
          stg1.Cells[0,i]:=dm.Qry524.fieldbyname('REPORT_FILE').Value;
          dm.Qry524.Next;
      end;
  stg1.Cells[0,stg1.RowCount-1]:='';
  stg1.Cells[1,stg1.RowCount-1]:='';

end;

end.
