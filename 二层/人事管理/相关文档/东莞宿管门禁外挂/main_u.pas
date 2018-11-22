unit main_u;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, StdCtrls, Buttons, ComCtrls, Grids, DBGridEh,common,
  ExtCtrls;

type
  Tfrm_main = class(TForm)
    con_door: TADOConnection;
    con_erp: TADOConnection;
    btn1: TBitBtn;
    lbl1: TLabel;
    btn2: TBitBtn;
    pb1: TProgressBar;
    qry1: TADOQuery;
    txt1: TStaticText;
    ds1: TDataSource;
    dbgrdh1: TDBGridEh;
    btn3: TBitBtn;
    pnl1: TPanel;
    pnl2: TPanel;
    pnl3: TPanel;
    BitBtn1: TBitBtn;
    qry2: TADOQuery;
    Label1: TLabel;
    edt1: TEdit;
    lbl2: TLabel;
    pgc1: TPageControl;
    ts1: TTabSheet;
    ts2: TTabSheet;
    BitBtn2: TBitBtn;
    Label2: TLabel;
    DBGridEh1: TDBGridEh;
    Panel1: TPanel;
    qry3: TADOQuery;
    ds2: TDataSource;
    qry3DSDesigner: TStringField;
    qry3DSDesigner2: TStringField;
    qry3DSDesigner3: TStringField;
    qry3DSDesigner4: TStringField;
    qry3DSDesigner5: TStringField;
    qry3DSDesigner6: TStringField;
    qry3DSDesigner7: TStringField;
    qry3DSDesigner8: TStringField;
    qry3DSDesigner9: TWideStringField;
    qry3DSDesigner10: TWideStringField;
    qry3DSDesigner11: TWideStringField;
    qry3DSDesigner12: TWideStringField;
    qry3DSDesigner13: TWideStringField;
    dtp1: TDateTimePicker;
    dtp2: TDateTimePicker;
    lbl3: TLabel;
    lbl4: TLabel;
    edt2: TEdit;
    btn4: TButton;
    Label3: TLabel;
    Button1: TButton;
    dtp3: TDateTimePicker;
    dtp4: TDateTimePicker;
    btnUpLoad: TBitBtn;
    procedure btn1Click(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btn2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btn3Click(Sender: TObject);
    procedure edt1Change(Sender: TObject);
    procedure btn4Click(Sender: TObject);
    procedure DBGridEh1TitleClick(Column: TColumnEh);
    procedure edt2Change(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure btnUpLoadClick(Sender: TObject);
    private
    PreColumn: TColumnEh;
    field_name:string;
  public
   sql_flag : Integer;
  end;
 
var
  frm_main: Tfrm_main;  

implementation

uses show_progress_u, doorlist_u;

{$R *.dfm}

procedure Tfrm_main.btn1Click(Sender: TObject);
begin
  try
    begin
      con_door.Open;         
      con_erp.Open;
      ShowMessage('测试完成');
      lbl1.Caption := '已连接';
      lbl1.Color := clGreen;
      btn1.Enabled := False;
      btn2.Enabled := True;
      BitBtn1.Enabled := True;

      Label2.Caption := '已连接';
      Label2.Color := clGreen;
      BitBtn2.Enabled := False;
      btn4.Enabled := True;
      Button1.Enabled := True;

    end;
  except
     ShowMessage('网络不通');
     lbl1.Caption := '未连接';
     lbl1.Color := clGray;
    end;
end;

procedure Tfrm_main.FormDestroy(Sender: TObject);
begin
  con_door.Close;
  con_erp.Close;
end;


procedure Tfrm_main.btn2Click(Sender: TObject);
begin

 frm_main.qry2.ExecSQL ;
 if qry2.Active = False then frm_main.qry2.Open;

end;

procedure Tfrm_main.FormCreate(Sender: TObject);

begin
  sql_flag := 0;
  field_name := DBGridEh1.Columns[2].FieldName;
  PreColumn := DBGridEh1.Columns[2];
  DBGridEh1.Columns[2].Title.Color := clred ;
  //
  dtp1.Date :=Now;
  //
  dtp2.Date :=Now ;
  dtp3.Date :=Now ;
  dtp4.Date :=Now ;
  //dtp1.Date :=strToDate(today);
  //dtp2.Date :=strToDate(today);
end;

procedure Tfrm_main.btn3Click(Sender: TObject);
begin
  Export_dbGridEH_to_Excel(dbgrdh1,'东梅深ID卡持有名单');
end;

procedure Tfrm_main.edt1Change(Sender: TObject);
begin
  if edt1.Text <>'' then
  dbgrdh1.DataSource.DataSet.Filter :=
  ' 工号 like '+#39+'%'+edt1.Text+'%'+#39+' or  姓名 like '+#39+'%'+edt1.Text+'%'+#39
  else   dbgrdh1.DataSource.DataSet.Filter :='';

end;

procedure Tfrm_main.btn4Click(Sender: TObject);
begin
   if qry3.Active = True then qry3.Active := False;
   //ShowMessage(FormatDateTime('yyyy-MM-dd HH:mm:ss',dtp1.DateTime));


   qry3.SQL.Text :='select doorpos as 位置,cardnum as 门禁卡号,worknum as 门禁工号,name 门禁姓名,dept as 门禁部门,'+
 ' time as 打卡时间,inout as 类型,cardstatus as 状态,wzemployeemsg.* '+
 ' from  dbo.MJCardUsed left join wzemployeemsg   '+
 ' on MJCardUsed.worknum=wzemployeemsg.工号 '+
 ' where time between '+
 QuotedStr( FormatDateTime('yyyy-MM-dd',dtp1.DateTime)+' '+ FormatDateTime('HH:mm:ss',dtp3.DateTime)  )+
 ' and '+
 QuotedStr( FormatDateTime('yyyy-MM-dd',dtp2.DateTime)+' '+ FormatDateTime('HH:mm:ss',dtp4.DateTime)  );
   
   //qry3.Parameters[0].Value:=StrToDateTime;
  // qry3.Parameters[0].Value:=StrToDateTime(FormatDateTime('yyyy-MM-dd HH:mm:ss',dtp2.DateTime));
  // qry3.Parameters[0].Value := FormatDateTime('yyyy-MM-dd HH:mm:ss',dtp1.DateTime);
  // qry3.Parameters[1].Value := FormatDateTime('yyyy-MM-dd HH:mm:ss',dtp2.DateTime);
   //
   //ShowMessage(qry3.SQL.Text);
   qry3.Open;
   
   Label3.Caption := IntToStr(DBGridEh1.DataSource.DataSet.RecordCount);
end;

procedure Tfrm_main.DBGridEh1TitleClick(Column: TColumnEh);
begin
if qry3.Active = False then Exit;
if DBGridEh1.DataSource.DataSet.FieldByName(Column.FieldName).DataType in [ftDate, ftTime, ftDateTime] then exit;

  if (field_name <> column.FieldName) then
  begin
    lbl4.Caption := column.Title.Caption ;
    field_name := column.FieldName ;
    edt2.SetFocus;
    PreColumn.Title.Color := clBtnFace ;
    Column.Title.Color := clred ;
    PreColumn := column ;
    edt2Change(edt2);
  end
  else
    edt2.SetFocus;
    if (column.Title.SortMarker =smDownEh) or (column.Title.SortMarker =smNoneEh) then
  begin
    column.Title.SortMarker:=smUpEh;
    qry3.Sort:=Column.FieldName;
  end
  else
  begin
     column.Title.SortMarker:=smDownEh;
     qry3.Sort:=Column.FieldName+' DESC';
  end;
end;

procedure Tfrm_main.edt2Change(Sender: TObject);
begin
    if DBGridEh1.DataSource.DataSet.FieldByName(field_name).DataType in [ftString,ftWideString,ftSmallint,ftInteger]  then
  begin
    if trim(edt2.text) <> '' then
    begin
      if DBGridEh1.DataSource.DataSet.FieldByName(field_name).DataType in  [ftString, ftWideString]  then
        DBGridEh1.DataSource.DataSet.Filter:=' (' +  field_name + ' like ''%' + trim(edt2.text) + '%'')'
      else if DBGridEh1.DataSource.DataSet.FieldByName(field_name).DataType in  [ftSmallint, ftInteger]  then
        DBGridEh1.DataSource.DataSet.Filter:=' (' + field_name+' >= ' + inttostr(strtointdef(edt2.text,0))+')';
    end else
      DBGridEh1.DataSource.DataSet.Filter:='';
  end;
   Label3.Caption := IntToStr(DBGridEh1.DataSource.DataSet.RecordCount);
end;

procedure Tfrm_main.Button1Click(Sender: TObject);
begin
 Export_dbGridEH_to_Excel(DBGridEh1,'门禁记录');
end;

procedure Tfrm_main.btnUpLoadClick(Sender: TObject);
begin
  try
    Screen.Cursor:=crHourGlass;
    frm_main.qry1.ExecSQL;
    Screen.Cursor:=crDefault;
    ShowMessage('上传OK');
  except

  end;

end;

end.
