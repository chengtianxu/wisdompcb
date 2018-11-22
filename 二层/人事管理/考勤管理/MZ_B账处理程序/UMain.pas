unit UMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, DB, ADODB, ComCtrls, StdCtrls, ExtCtrls;

type
  TForm1 = class(TForm)
    pnl1: TPanel;
    Panel1: TPanel;
    pgc1: TPageControl;
    ts3: TTabSheet;
    lbl10: TLabel;
    lbl11: TLabel;
    lbl12: TLabel;
    btn2: TButton;
    btn_BakData: TButton;
    btn_ReInsert: TButton;
    BDate: TDateTimePicker;
    EDate: TDateTimePicker;
    pnl17: TPanel;
    pb1: TProgressBar;
    dlgOpen1: TOpenDialog;
    ds1: TDataSource;
    qry_class: TADOQuery;
    qry_classchinesename: TWideStringField;
    qry_classemployeecode: TWideStringField;
    qry_classcheckdate: TDateTimeField;
    qry_classclassname: TWideStringField;
    qry_classrkey: TAutoIncField;
    qry_classclassid: TIntegerField;
    ds2: TDataSource;
    qry_Lclass: TADOQuery;
    qry_Lclasschinesename: TWideStringField;
    qry_Lclassemployeecode: TWideStringField;
    qry_Lclasscheckdate: TDateTimeField;
    qry_Lclassresttype: TIntegerField;
    qry_Lclassrkey: TAutoIncField;
    qry_Lclassclassid: TIntegerField;
    ds3: TDataSource;
    qry_Holiday: TADOQuery;
    WideStringField4: TWideStringField;
    WideStringField5: TWideStringField;
    DateTimeField2: TDateTimeField;
    WideStringField6: TWideStringField;
    pm1: TPopupMenu;
    mniN1: TMenuItem;
    pm2: TPopupMenu;
    mniedit2: TMenuItem;
    qrytemp: TADOQuery;
    qry_UpdateView: TADOQuery;
    dtp1: TDateTimePicker;
    procedure btn_BakDataClick(Sender: TObject);
    procedure btn2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btn_ReInsertClick(Sender: TObject);
  private
    { Private declarations }
     NDate,BMonth,EMonth:string;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation
  uses UDM;
{$R *.dfm}

procedure TForm1.btn_BakDataClick(Sender: TObject);
var
  Lsql:string;
begin

if messagedlg('请确认要备份的年月份正确，继续吗？',   mtconfirmation,[mbyes,mbno],0)=mrno then exit;
 try
 BMonth:=FormatDateTime('yyyy-MM',Bdate.date);
 EMonth:=FormatDateTime('yyyy-MM',Edate.date);
 NDate:=FormatDateTime('yyyyMMddhhmm',now)+'_'+copy(BMonth,1,4)+copy(BMonth,6,2) +'_'+copy(EMonth,1,4)+copy(EMonth,6,2);
 
  try
    dm.con1.BeginTrans;
    Lsql:='exec sp_BakData '''+BMonth+''','''+EMonth+''','''+NDate+''' ';
    dm.execsql(qrytemp,Lsql);

    //备份的日期月份等更新到一个表中记录；
    Lsql:='update bakDataDate set BMonth='''+BMonth+''',EMonth='''+EMonth+''',ADate='''+NDate+''' ';
    dm.execsql(qrytemp,Lsql);
    dm.con1.CommitTrans;
    ShowMessage('备份完成!');
  finally
   dm.con1.RollbackTrans;
  end; 
  except on e:Exception  do
  begin
    ShowMessage('错误:'+e.Message);
  end;
 end;
end;

procedure TForm1.btn2Click(Sender: TObject);
begin
 if messagedlg('请确认年月份是否正确,不可重复重成考勤哦！',   mtconfirmation,[mbyes,mbno],0)=mrno then exit;

end;

procedure TForm1.FormShow(Sender: TObject);
begin
  BDate.Date:= Incmonth(now,-12);
  EDate.Date:= Incmonth(now,-2);
  dtp1.Date:= Incmonth(now,-1);

  
end;

procedure TForm1.btn_ReInsertClick(Sender: TObject);
var
  Lsql:string;
begin
 try
    dm.con1.BeginTrans;
  Lsql:='select *  from bakdatadate';
  dm.OpenQry(dm.qrytemp,Lsql);
   BMonth:= dm.qrytemp.fieldbyname('BMonth').asstring;
   EMonth:= dm.qrytemp.fieldbyname('EMonth').asstring;
   Ndate:=  dm.qrytemp.fieldbyname('ADate').asstring;
   
  Lsql:='exec sp_ReInsert '''+BMonth+''','''+EMonth+''','''+NDate+''' ';
   //ShowMessage(Lsql);
   dm.execsql(qrytemp,Lsql);

 dm.con1.CommitTrans;
 ShowMessage('插入完成!');
 except on e: exception do
   begin
   ShowMessage('插入错误：'+e.Message);
   dm.con1.RollbackTrans;
   Exit;
   end;
 end;
end;

end.

