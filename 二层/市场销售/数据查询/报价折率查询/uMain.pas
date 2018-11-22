unit uMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ToolWin, ComCtrls, ImgList, Grids, DBGridEh, DB,Excel2000,
  ComObj,math, StdCtrls, ExtCtrls,ADODB;

type
  TfrmMain = class(TForm)
    ImageList1: TImageList;
    DataSource1: TDataSource;
    DBGridEh1: TDBGridEh;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton3: TToolButton;
    ToolButton2: TToolButton;
    DataSource2: TDataSource;
    DBGridEh2: TDBGridEh;
    Panel2: TPanel;
    Label1: TLabel;
    Edit1: TEdit;
    CheckBox1: TCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ToolButton1Click(Sender: TObject);
    procedure ToolButton2Click(Sender: TObject);
    procedure DBGridEh1TitleClick(Column: TColumnEh);
    procedure ToolButton3Click(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure DBGridEh1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGridEh2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    _SQL:string;
    _SQL17:string;

    _FN:string;
    _Check:boolean;
    procedure GetNewPrice();
    procedure Get85_17NewPrice();        //过滤85-17最新报价
    procedure ExPortExcel(const pStrgrids:array of TdbGrideh;pCap:array of string);
  public
    _Dt1,_Dt2:TDate;

  end;

var
  frmMain: TfrmMain;

implementation

uses uCondition, uDM,common;

{$R *.dfm}

procedure TfrmMain.FormCreate(Sender: TObject);

begin
if not app_init(dm.Conn) then
begin
 showmsg('程序起动失败,请联系管理员!',1);
 application.Terminate;
end;

 self.Caption:=application.Title;

  DateSeparator := '-';
  ShortDateFormat := 'yyyy-mm-dd';

end;
//过滤最新报价
procedure TfrmMain.GetNewPrice();
var
// vdt:Tdatetime;
 vCustParTNo:string;
begin
 dm.DS85.Filter:='';
 dm.DS85.Sort := 'CUST_PART_NO,enter_DATE DESC' ;
 dm.DS85.DisableControls;
 dm.DS85.First;
 vCustParTNo := trim(dm.DS85CUST_PART_NO.Value);
// vdt := dm.DS85.FieldValues['QTE_DATE'];
 dm.DS85.Next;
 while not dm.DS85.Eof do
  begin
   if vCustParTNo = trim(dm.DS85CUST_PART_NO.Value) then
    begin
     dm.DS85.Delete;
    end
   else         //换行
    begin
     vCustParTNo:=trim(dm.DS85CUST_PART_NO.Value);
     dm.ds85.Next;
    end;
  end;
 dm.DS85.EnableControls;
 if trim(edit1.text)<>'' then
  dm.DS85.Filter :=_FN+' like ''%'+trim(edit1.text)+'%'''
end;

procedure TfrmMain.Get85_17NewPrice();        //过滤85-17最新报价
var
// vdt:Tdatetime;
 vCustParTNo:string;
begin
 dm.ADS85_17.Filter:='';
 dm.ADS85_17.Sort := 'CUST_PART_NO,enter_DATE DESC' ;
 dm.ADS85_17.DisableControls;
 dm.ADS85_17.First;

 vCustParTNo:=trim(dm.ADS85_17CUST_PART_NO.Value);

 dm.ADS85_17.Next;
 while not dm.ADS85_17.Eof do
  begin
   if vCustParTNo=trim(dm.ADS85_17CUST_PART_NO.Value) then
    begin
     dm.ADS85_17.Delete
    end
   else         //换行
    begin
     vCustParTNo:=trim(dm.ADS85_17CUST_PART_NO.Value);
     dm.ADS85_17.Next;
    end;
  end;
 dm.ADS85_17.EnableControls;
   if trim(edit1.text)<>'' then
    dm.ADS85_17.Filter :=_FN+' like ''%'+trim(edit1.text)+'%'''
end;

procedure TfrmMain.ExPortExcel(const pStrgrids:array of TdbGrideh;pCap:array of string);
var
 iCount, jCount, v_cloumn,j: Integer;
 XLApp: Variant;
 Sheet,Sect: Variant;

begin

 Screen.Cursor := crHourGlass;
 if not VarIsEmpty(XLApp) then
 begin
   XLApp.DisplayAlerts := False;
   XLApp.Quit;
   VarClear(XLApp);
 end;
 try
   XLApp := CreateOleObject('Excel.Application');
 except
   Screen.Cursor := crDefault;
   Exit;
 end;

 XLApp.SheetsInNewWorkbook :=High(pStrgrids)+1;
 XLApp.WorkBooks.Add;
 for j:=Low(pStrgrids) to High(pStrgrids) do
 begin

   XLApp.WorkBooks[1].WorkSheets[j+1].Name := pCap[j];

   Sheet := XLApp.Workbooks[1].WorkSheets[j+1];

   v_cloumn:=math.Floor(pStrgrids[j].Columns.Count/2);

   Sheet.Cells[1, v_cloumn] :=pCap[j];

   Sheet.Cells[1, v_cloumn].Font.bold := True;
   Sheet.Cells[1, v_cloumn].Font.Size := 16;

   Sheet.Cells[2, v_cloumn+1].Font.bold := True;
   v_cloumn:=0;
   //列头
   for iCount := 0 to pStrgrids[j].Columns.Count - 1 do
    begin
       Sheet.Cells[3, iCount + 1 - v_cloumn] :=pStrgrids[j].Columns[iCount].Title.Caption;
       Sheet.Cells[3, iCount + 1 - v_cloumn].Font.bold := True;
    end;

   jCount:= 4;
   //行

  pStrgrids[j].DataSource.DataSet.DisableControls;
  if pStrgrids[j].DataSource.DataSet.Active=true then
   while not pStrgrids[j].DataSource.DataSet.eof do
   begin
     v_cloumn:=0;
     for iCount := 0 to pStrgrids[j].Columns.Count - 1 do
       Sheet.Cells[jCount, iCount + 1 - v_cloumn] :=pStrgrids[j].DataSource.DataSet.Fieldbyname(pStrgrids[j].Columns[iCount].FieldName).AsString;
     Inc(jCount);
     pStrgrids[j].DataSource.DataSet.Next ;
   end;
  pStrgrids[j].DataSource.DataSet.EnableControls;
 end;
 XlApp.Visible := True;
 Screen.Cursor := crDefault;
end;

procedure TfrmMain.FormShow(Sender: TObject);
begin
 if  dm.Conn.Connected then
  begin
   _Dt1:=date()-30;
   _Dt2:=date();
   _SQL:=dm.DS85.CommandText;
   _SQL17:=dm.ADS85_17.CommandText;
   _FN:='TNUMBER';
  end;


end;                                                     
//查询
procedure TfrmMain.ToolButton1Click(Sender: TObject);
begin
try
 Application.CreateForm(TfrmCondition, frmCondition);
 frmCondition.DTPk5.Date:=_Dt1;
 frmCondition.DTPk6.Date:=_Dt2;

if frmCondition.ShowModal=mrok then
begin
 if not frmCondition.CheckBox1.Checked  then
  begin
   dm.DS85.Close;
   DBGridEh1.Visible:=true;
   DBGridEh2.Visible:=false;
   CheckBox1.Visible:=true;
   dm.DS85.CommandText:=_SQL+frmCondition._SearchStr;
   dm.DS85.Open ;
  end
 else
  begin
   dm.ADS85_17.Close;
   CheckBox1.Visible:=false;
   DBGridEh1.Visible:=false;
   DBGridEh2.Visible:=true;
   dm.ADS85_17.CommandText:=_SQL17+frmCondition._SearchStr;
   dm.ADS85_17.Open ;
  end;
 _Check:=frmCondition.CheckBox1.Checked;
 _Dt1:=frmCondition.DTPk5.Date;
 _Dt2:=frmCondition.DTPk6.Date;

end;
finally
 frmCondition.Free ;
end;
end;

procedure TfrmMain.ToolButton2Click(Sender: TObject);
begin
 close;
 application.Terminate;
end;

procedure TfrmMain.DBGridEh1TitleClick(Column: TColumnEh);
begin
if (Column.FieldName='type') OR
   (Column.FieldName='status') then exit;
 if column.Title.SortMarker =smDownEh then
  begin
   column.Title.SortMarker:=smUpEh;
   if _Check=false then
    dm.DS85.IndexFieldNames:=Column.FieldName
   else
    dm.ADS85_17.IndexFieldNames:=Column.FieldName;
  end
 else
  begin
   column.Title.SortMarker:=smDownEh;
   if _Check=false then
    dm.DS85.IndexFieldNames:=Column.FieldName+' DESC'
   else
    dm.ADS85_17.IndexFieldNames:=Column.FieldName+' DESC';
  end;
 //查找
 if Column.Field.DataType<>ftstring then exit;
 _FN:=Column.FieldName;
 label1.Caption:=column.Title.Caption+'：';

end;

procedure TfrmMain.Edit1Change(Sender: TObject);
begin
 if _Check=false then
  begin
   if trim(edit1.text)<>'' then
    dm.DS85.Filter :=_FN+' like ''%'+trim(edit1.text)+'%'''
   else
    dm.DS85.Filter :='';
  end
 else
  begin
   if trim(edit1.text)<>'' then
    dm.ADS85_17.Filter :=_FN+' like ''%'+trim(edit1.text)+'%'''
   else
    dm.ADS85_17.Filter :='';
  end;
end;

//导出excel
procedure TfrmMain.ToolButton3Click(Sender: TObject);
begin
 if _Check=false then
  begin
   if dm.DS85.Active=false then exit;
   if dm.DS85.RecordCount=0 then exit;
   dm.DS85.First;
    ExPortExcel([dbgrideh1],['报价折率查询']);
  end
 else
  begin
   if dm.ADS85_17.Active=false then exit;
   if dm.ADS85_17.RecordCount=0 then exit;
   dm.ADS85_17.First;
    ExPortExcel([dbgrideh2],['报价折率查询']);
  end;
end;
//显示最新报价
procedure TfrmMain.CheckBox1Click(Sender: TObject);
begin
if dm.DS85.Active=false then exit;
if checkbox1.Checked then
 begin
  if _Check=false then
   GetNewPrice
  else
   Get85_17NewPrice;
 end
else
  if _Check=false then
   begin
    dm.DS85.CancelBatch();
    dm.DS85.Close ;
    dm.DS85.Open;
   end
  else
    begin
     dm.ADS85_17.Close;
     dm.ADS85_17.Open ;
    end;
end;


procedure TfrmMain.DBGridEh1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if (chr(key)='V') and (ssalt in shift) then
  showmessage(dm.DS85.CommandText);
end;

procedure TfrmMain.DBGridEh2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if (chr(key)='V') and (ssalt in shift) then
  showmessage(dm.ADS85_17.CommandText);
end;

procedure TfrmMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
if dm.DS85.Active then dm.DS85.Close;
if dm.ADS85_17.Active then dm.ADS85_17.Close;
end;

end.
