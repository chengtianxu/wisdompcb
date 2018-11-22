unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DateUtils,DBGrids, StdCtrls, Buttons, DB, ADODB, Mask,ClipBrd,ComObj,
  ComCtrls, ExtCtrls, DBGridEh;

type
  TForm1 = class(TForm)
    ADOConnection1: TADOConnection;
    adosp1: TADOStoredProc;
    ADOStoredProc1: TADOStoredProc;
    DataSource1: TDataSource;
    tmp: TADOQuery;
    DBGridEh1: TDBGridEh;
    Panel1: TPanel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    Label1: TLabel;
    SpeedButton3: TSpeedButton;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    SpeedButton4: TSpeedButton;
    Label5: TLabel;
    SpeedButton5: TSpeedButton;
    Edit1: TEdit;
    dtp1: TDateTimePicker;
    dtp2: TDateTimePicker;
    Edit2: TEdit;
    DataSource2: TDataSource;
    procedure SpeedButton2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure SpeedButton5Click(Sender: TObject);
  private

    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation
uses unit2,Frm_Selection_u,common;
{$R *.dfm}


procedure TForm1.FormCreate(Sender: TObject);
begin
 if not app_init(self.ADOConnection1) then
 begin
  showmsg('程序起动失败,请联系管理员!',1);
  application.Terminate;
 end;
 self.Caption:=application.Title;
  

 //user_ptr:='154';
// vprev:='4';
// self.ADOConnection1.Open;
end;

procedure TForm1.SpeedButton2Click(Sender: TObject);
var i,j:integer;
   acount: currency;
   date1,date2:tdatetime;
begin
  edit2.SetFocus;
  if dtp1.Date  > dtp2.Date then
   begin
    showmessage('起始日期不能大于结束日期！');
    exit;
   end;
    screen.Cursor:=crSQLWait;
    date1:=dtp1.Date;
    date2:=strtodatetime(datetostr(dtp2.Date)+' 23:59:59');
    adosp1.Close;
    adosp1.Parameters.ParamByName('@date1').Value := date1;
    adosp1.Parameters.ParamByName('@date2').Value := date2;
    adosp1.Parameters.ParamByName('@cust').Value := trim(edit1.Text);
    adosp1.Parameters.ParamByName('@Factory').Value := trim(edit2.Text);
    adosp1.Open;
    screen.Cursor:=crDefault;
end;

procedure TForm1.FormShow(Sender: TObject);
var i:integer;
begin
  DBGridEh1.Columns[0].Title.caption:='日    期';
  DBGridEh1.Columns[0].FieldName:='date1';
  DBGridEh1.Columns[1].Title.caption:='销售面积（单）';
  DBGridEh1.Columns[2].Title.caption:='销售面积（双）';
  DBGridEh1.Columns[3].Title.caption:='销售面积（多）';
  DBGridEh1.Columns[4].Title.caption:='销售金额（单）';
  DBGridEh1.Columns[5].Title.caption:='销售金额（双）';
  DBGridEh1.Columns[6].Title.caption:='销售金额（多）';
  DBGridEh1.Columns[7].Title.caption:='退货面积（单）';
  DBGridEh1.Columns[8].Title.caption:='退货面积（双）';
  DBGridEh1.Columns[9].Title.caption:='退货面积（多）';
  DBGridEh1.Columns[10].Title.caption:='退货金额（单）';
  DBGridEh1.Columns[11].Title.caption:='退货金额（双）';
  DBGridEh1.Columns[12].Title.caption:='退货金额（多）';
  DBGridEh1.Columns[13].Title.caption:='交货面积（单）';
  DBGridEh1.Columns[14].Title.caption:='交货面积（双）';
  DBGridEh1.Columns[15].Title.caption:='交货面积（多）';
  DBGridEh1.Columns[16].Title.caption:='交货金额（单）';
  DBGridEh1.Columns[17].Title.caption:='交货金额（双）';
  DBGridEh1.Columns[18].Title.caption:='交货金额（多）';
  DBGridEh1.Columns[19].Title.caption:='投产面积（单）';
  DBGridEh1.Columns[20].Title.caption:='投产面积（双）';
  DBGridEh1.Columns[21].Title.caption:='投产面积（多）';
  DBGridEh1.Columns[22].Title.caption:='投产金额（单）';
  DBGridEh1.Columns[23].Title.caption:='投产金额（双）';
  DBGridEh1.Columns[24].Title.caption:='投产金额（多）';
  DBGridEh1.Columns[25].Title.caption:='报废面积（单）';
  DBGridEh1.Columns[26].Title.caption:='报废面积（双）';
  DBGridEh1.Columns[27].Title.caption:='报废面积（多）';
  DBGridEh1.Columns[28].Title.caption:='报废金额（单）';
  DBGridEh1.Columns[29].Title.caption:='报废金额（双）';
  DBGridEh1.Columns[30].Title.caption:='报废金额（多）';
  for i:=1 to 30 do
  begin
    DBGridEh1.Columns[i].FieldName:='f'+inttostr(i);
    DBGridEh1.Columns[i].Footer.FieldName:=DBGridEh1.Columns[i].FieldName;
  end;
  dtp2.Date := date();
  dtp1.Date := dtp2.Date-30;
end;

procedure TForm1.SpeedButton1Click(Sender: TObject);
begin
  application.Terminate;
end;

procedure TForm1.SpeedButton3Click(Sender: TObject);
var
 iCount, jCount, v_cloumn: Integer;
 XLApp: Variant;
 Sheet: Variant;
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
   XLApp.WorkBooks.Add;
   XLApp.SheetsInNewWorkbook := 1;
   XLApp.WorkBooks[1].WorkSheets[1].Name := self.Caption;
   Sheet := XLApp.Workbooks[1].WorkSheets[self.Caption];
   if not TDBGrideh(self.DBGrideh1).DataSource.DataSet.Active then
     begin
      Screen.Cursor := crDefault;
      Exit;
     end;
   TDBGrideh(DBGrideh1).DataSource.DataSet.DisableControls;
   TDBGrideh(DBGrideh1).DataSource.DataSet.first;
   v_cloumn:=TDBGrideh(DBGrideh1).Columns.Count;
   v_cloumn:=(v_cloumn div 2);

   Sheet.Cells[1, v_cloumn] :='经营状况表';
   Sheet.Cells[1, v_cloumn].Font.bold := True;
   Sheet.Cells[1, v_cloumn].Font.Size := 16;
   v_cloumn:=0;
   //列头
   for iCount := 0 to TDBGrideh(DBGrideh1).Columns.Count - 1 do
     if TDBGrideh(DBGrideh1).Columns.Items[iCount].Visible=true then
       begin
         Sheet.Cells[3, iCount + 1 - v_cloumn] :=
         TDBGrideh(DBGrideh1).Columns.Items[iCount].Title.Caption;
        Sheet.Cells[3, iCount + 1 - v_cloumn].Font.bold := True;
       end
     else
      inc(v_cloumn);
   jCount := 4;
   //行
   while not TDBGrideh(DBGrideh1).DataSource.DataSet.Eof do
     begin
      v_cloumn:=0;
      for iCount := 0 to TDBGrideh(DBGrideh1).Columns.Count - 1 do
       if TDBGrideh(DBGrideh1).Columns.Items[iCount].Visible=true then
         begin
          Sheet.Cells[jCount, iCount + 1 - v_cloumn] :=
            TDBGrideh(DBGrideh1).Columns.Items[iCount].Field.AsString;
         end
       else
        inc(v_cloumn);
      Inc(jCount);
      TDBGrideh(DBGrideh1).DataSource.DataSet.Next;
     end;

   for iCount := 1 to TDBGrideh(DBGrideh1).Columns.Count do
   begin
      Sheet.Cells[jCount, iCount] :=TDBGrideh(DBGrideh1).GetFooterValue(0,TDBGrideh(DBGrideh1).Columns[iCount-1]);
      Sheet.Cells[jCount, iCount].Font.bold := True;
   end ;
   XlApp.Visible := True;
   TDBGrideh(DBGrideh1).DataSource.DataSet.EnableControls;
   Screen.Cursor := crDefault;
end;



procedure TForm1.SpeedButton4Click(Sender: TObject);
begin
form2:=tform2.Create(self);
with ADOStoredProc1 do
  begin
    Close;
    parameters.ParamByName('@order').Value :=0;
    open;
  end;
if form2.ShowModal = mrok then
  begin
    edit1.Text := ADOStoredProc1.fieldbyname('cust_code').AsString;
  end;
form2.Free;
end;

procedure TForm1.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
if key=#13 then
    SpeedButton2.Click;
end;

procedure TForm1.SpeedButton5Click(Sender: TObject);
begin
   Tmp.Close;
   Tmp.SQL.Text:='select warehouse_code as ''代码'',warehouse_name ''名称'',abbr_name ''简称'' from data0015';
   Tmp.Open;
   with TFrm_Selection.Create(nil) do
   begin
      Panel1.Visible:=false;
      caption:='选择工厂';
      DS.DataSet:=Tmp;
      GrdSel.columns[0].width:=50;
      GrdSel.columns[1].width:=220;
      if showmodal=mrok then
        edit2.Text:=Tmp.Fields[0].AsString;
      free;
   end;
end;

end.
