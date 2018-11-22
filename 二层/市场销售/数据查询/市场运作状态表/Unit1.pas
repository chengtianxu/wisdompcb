unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, StdCtrls, Mask, Buttons,ClipBrd,ComObj, ComCtrls,
  Grids, DBGridEh, DBClient, DateUtils, DBGrids, DBSumLst, PrnDbgeh;

type
  TFrmMain = class(TForm)
    db_ptr: TLabel;
    ADOConnection1: TADOConnection;
    adosp1: TADOStoredProc;
    dbeh1: TDBGridEh;
    ds1: TDataSource;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label3: TLabel;
    dtp1: TDateTimePicker;
    dtp2: TDateTimePicker;
    Label2: TLabel;
    Label4: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    DataSource1: TDataSource;
    Label5: TLabel;
    SpeedButton4: TSpeedButton;
    print1: TPrintDBGridEh;
    ADOQuery1: TADOQuery;
    ADODataSet1: TADODataSet;
    cds1: TADOQuery;
    cds1date1: TDateTimeField;
    cds1f1: TFloatField;
    cds1f2: TFloatField;
    cds1f3: TFloatField;
    cds1f4: TFloatField;
    cds1f5: TFloatField;
    cds1f6: TFloatField;
    cds1f7: TFloatField;
    cds1f8: TFloatField;
    cds1f9: TFloatField;
    cds1f10: TFloatField;
    cds1f11: TFloatField;
    cds1f12: TFloatField;
    cds1f13: TFloatField;
    cds1f14: TFloatField;
    cds1f15: TFloatField;
    cds1f16: TFloatField;
    cds1f17: TFloatField;
    cds1f18: TFloatField;
    cds1f19: TFloatField;
    cds1f20: TFloatField;
    cds1f21: TFloatField;
    cds1f22: TFloatField;
    cds1f23: TFloatField;
    cds1f24: TFloatField;
    cds1f25: TFloatField;
    cds1f26: TFloatField;
    cds1f27: TFloatField;
    procedure FormCreate(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure Edit2Exit(Sender: TObject);
    procedure dbeh1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
  private

    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmMain: TFrmMain;

implementation
uses unit2,common,Pick_Item_Single ,ConstVar;
{$R *.dfm}

procedure TFrmMain.FormCreate(Sender: TObject);
begin
 if not app_init(self.ADOConnection1) then
  begin
   showmsg('程序起动失败请,请与管理员联系!',1);
   application.Terminate;
  end;
  self.Caption:=application.Title;
  self.WindowState := wsMaximized;


  //vprev:='4';
  //user_ptr:='14';
  //self.ADOConnection1.Open;

  DateSeparator := '-';
  shortDateFormat := 'yyyy-MM-dd';
  longtimeFormat := 'hh:nn';
end;

procedure TFrmMain.SpeedButton2Click(Sender: TObject);
var
  i:integer;
  v_total_0,v_total_1,v_total_2:double;
begin
 if dtp1.Date  > dtp2.Date  then
  begin
   showmessage('起始日期不能大于结束日期！');
   exit;
  end;

  try
  screen.Cursor := crSQLWait;
  ds1.DataSet := nil;
  cds1.Close;
  cds1.SQL.Text:='exec wzsp1407 '''+datetostr(dtp1.Date)+''','''+datetostr(dtp2.date)+''','''+
                 trim(edit1.Text)+'%'','''+trim(edit2.Text)+'%''';
  cds1.Open;

 cds1.Last;
 v_total_0:=cds1f4.AsFloat-cds1f1.AsFloat+cds1f10.AsFloat;
 v_total_1:=cds1f5.AsFloat-cds1f2.AsFloat+cds1f11.AsFloat;
 v_total_2:=cds1f6.AsFloat-cds1f3.AsFloat+cds1f12.AsFloat;

 cds1.Prior;
 while not cds1.Bof do
  begin
   cds1.Edit;
   cds1['f4']:=v_total_0;
   cds1['f5']:=v_total_1;
   cds1['f6']:=v_total_2;
   cds1.Post;
   v_total_0:=v_total_0-cds1f1.AsFloat+cds1f10.AsFloat;
   v_total_1:=v_total_1-cds1f2.AsFloat+cds1f11.AsFloat;
   v_total_2:=v_total_2-cds1f3.AsFloat+cds1f12.AsFloat;
   cds1.Prior;
  end;

except
 showmessage('程序运行过程中遇到数据错误请与管理员联系!');

end;

ds1.DataSet := cds1;
screen.Cursor :=crDefault;
end;

procedure TFrmMain.FormShow(Sender: TObject);
begin
 if  Adoconnection1.Connected then
  begin


dtp2.Date := getsystem_date(self.ADOQuery1,1);
dtp1.Date :=dtp2.Date-dayof(dtp2.Date)+1;
  end;
end;

procedure TFrmMain.SpeedButton1Click(Sender: TObject);
begin
if cds1.Active then cds1.CancelBatch();
application.Terminate;
end;

procedure TFrmMain.BitBtn1Click(Sender: TObject);
begin
 form2:=tform2.Create(self);
 with self.ADODataSet1  do
  begin
   Close;
   CommandText:='select cust_code,abbr_name from data0010'+#13+
   'order by cust_code';
   open;
  end;
  form2.caption:='客户查询';
 if form2.ShowModal = mrok then
  begin
   edit1.Text := ADODataSet1.fieldbyname('cust_code').AsString;
  end;
form2.Free;

end;

procedure TFrmMain.BitBtn2Click(Sender: TObject);
var
  InputVar: PDlgInput ;
begin
try
 frmPick_Item_Single := TfrmPick_Item_Single.Create(application) ;
 InputVar.Fields := 'WAREHOUSE_CODE/工厂代码/60,WAREHOUSE_NAME/工厂名称/230,abbr_name/工厂简称/80';
 InputVar.Sqlstr := 'select RKEY,WAREHOUSE_CODE,WAREHOUSE_NAME,abbr_name from data0015 '+
                     'order by WAREHOUSE_CODE';
 inputvar.KeyField:='WAREHOUSE_CODE';
 inputvar.InPut_value:=edit2.Text;
 InputVar.AdoConn := ADOConnection1 ;
 frmPick_Item_Single.InitForm_New(InputVar)  ;
if frmPick_Item_Single.ShowModal=mrok then
 begin
  label5.Caption := frmPick_Item_Single.adsPick.Fieldbyname('abbr_name').AsString;
  edit2.Text := frmPick_Item_Single.adsPick.FieldValues['WAREHOUSE_CODE'];
 end;
finally
 frmPick_Item_Single.adsPick.Close;
 frmPick_Item_Single.Free ;
end;
end;

procedure TFrmMain.SpeedButton3Click(Sender: TObject);
var
  asheet:Variant;
  j:integer;
  tslist:tstringlist;
  vstr:string;
begin
  if messagedlg('要把数据资料导出到EXCEL文件吗？',mtconfirmation,[mbYes,mbNo],0)<>mrYes then exit;
  try
  asheet:=CreateOleObject( 'Excel.Application' );
  except
    messagedlg('是否正确安装了EXCEL？',mtinformation,[mbok],0);
    Abort;
  end;
  try
  Screen.Cursor := crHourglass;
  asheet.Workbooks.Add;
  asheet.WorkSheets[1].Activate;
  asheet.activeSheet.Name :='市场运作状态表';
  tslist:=tstringlist.Create;
  vstr:=#9+#9+#9+#9+ asheet.activeSheet.Name ;
  tslist.Add(vstr);
  vstr:='';
  for j:=0 to DBeh1.Columns.Count-1 do
   if  DBeh1.Columns.Items[j].Visible then
    vstr:=vstr+#9+DBeh1.Columns[j].Title.Caption ;
  tslist.add(vstr);
  vstr:='';
  cds1.DisableControls;
  cds1.First;
  with cds1 do
  while not eof do
  begin
    for j:=0 to DBeh1.Columns.Count-1 do
     if  DBeh1.Columns.Items[j].Visible then
      begin
        vstr:=vstr+#9+DBeh1.Columns.Items[j].Field.text;
      end;
    tslist.Add(vstr);
    vstr:='';
    next;
  end;
    clipboard.Clear;
    Clipboard.AsText:=tsList.Text;
    asheet.activeSheet.paste;
    tslist.Clear;
   tslist.free;
   asheet.visible:=true;

   finally
    cds1.First ;
    cds1.EnableControls ;
     Screen.Cursor := crDefault;
   end;
end;
//SaveDBGridEhToExportFile(TDBGridEhExportAsXLS,DBEh1,'c:\file1.XLS',true);


procedure TFrmMain.SpeedButton4Click(Sender: TObject);
begin
//print1.PrinterSetupDialog;
print1.Preview;
end;

procedure TFrmMain.Edit2Exit(Sender: TObject);
begin
if trim(edit2.Text)='' then
 label5.Caption:=''
else
 if activecontrol.Name<>'BitBtn2' then
  with adoquery1 do
  begin
   close;
   sql.Text:=
    'SELECT data0015.rkey,dbo.Data0015.WAREHOUSE_CODE, dbo.Data0015.WAREHOUSE_NAME,'+#13+
    'data0015.abbr_name FROM dbo.Data0015'+#13+
     'where WAREHOUSE_CODE='+quotedstr(trim(edit2.Text));
   open;
   if isempty then
    begin
     messagedlg('工厂代码输入错误!',mterror,[mbcancel],0);
     edit2.SetFocus;
    end
   else
    begin
     label5.Caption:=fieldbyname('abbr_name').AsString;
    end;
   close; 
  end;
end;

procedure TFrmMain.dbeh1DrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
begin
    if (Column.Field is TFloatfield) and (Column.Field.AsFloat=0)  then
    begin
      dbeh1.Canvas.Rectangle(Rect);
      exit;
    end;
end;

end.
