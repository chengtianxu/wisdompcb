unit Unit_expense;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGridEh, StdCtrls, Buttons, ExtCtrls, DB,Excel2000,ClipBrd,
  ComObj;

type
  TForm_expense = class(TForm)
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn2: TBitBtn;
    DBGridEh1: TDBGridEh;
    DataSource1: TDataSource;
    BitBtn4: TBitBtn;
    Label1: TLabel;
    ComboBox1: TComboBox;
    BitBtn5: TBitBtn;
    OpenDialog1: TOpenDialog;
    procedure BitBtn3Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure DBGridEh1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn4Click(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
  private
    { Private declarations }
    FAFc:array[0..9] of integer;
   procedure CopyDbDataToExcel(Args:array of const;title_caption:string);
  public
    { Public declarations }
  end;

var
  Form_expense: TForm_expense;

implementation

uses damo,main, Unit_unfinished;
{$R *.dfm}


procedure TForm_expense.CopyDbDataToExcel(Args:array of const;title_caption:string);
var
 iCount, jCount, v_cloumn: Integer;
 XLApp: Variant;
 Sheet: Variant;
 I: Integer;
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
 XLApp.SheetsInNewWorkbook := High(Args) + 1;

 for I := Low(Args) to High(Args) do
 begin
   XLApp.WorkBooks[1].WorkSheets[I+1].Name := title_caption;
   Sheet := XLApp.Workbooks[1].WorkSheets[title_caption];
   if not TDBGrideh(Args[I].VObject).DataSource.DataSet.Active then
    begin
     Screen.Cursor := crDefault;
     Exit;
    end;
   TDBGrideh(Args[I].VObject).DataSource.DataSet.DisableControls;
   TDBGrideh(Args[I].VObject).DataSource.DataSet.first;

   v_cloumn:=0;
   for iCount := 0 to TDBGrideh(Args[I].VObject).Columns.Count - 1 do
    if TDBGrideh(Args[I].VObject).Columns.Items[iCount].Visible=true then
     Sheet.Cells[1, iCount + 1 - v_cloumn] :=
     TDBGrideh(Args[I].VObject).Columns.Items[iCount].Title.Caption
    else
     inc(v_cloumn);

   jCount := 1;
   while not TDBGrideh(Args[I].VObject).DataSource.DataSet.Eof do
   begin
     v_cloumn:=0;
     for iCount := 0 to TDBGrideh(Args[I].VObject).Columns.Count - 1 do
      if TDBGrideh(Args[I].VObject).Columns.Items[iCount].Visible=true then
       Sheet.Cells[jCount + 1, iCount + 1 - v_cloumn] :=
       TDBGrideh(Args[I].VObject).Columns.Items[iCount].Field.AsString
      else
       inc(v_cloumn);
     Inc(jCount);
     TDBGrideh(Args[I].VObject).DataSource.DataSet.Next;
   end;

   XlApp.Visible := True;
   TDBGrideh(Args[I].VObject).DataSource.DataSet.EnableControls;
 end;
 Screen.Cursor := crDefault;
end;

procedure TForm_expense.BitBtn3Click(Sender: TObject);
begin
 dm.ADOD424.CancelBatch();
 close;
end;

procedure TForm_expense.FormCreate(Sender: TObject);
var i:integer;
begin
 with dm.ADOD424 do
 begin
  close;
  parameters.ParamByName('vptr').Value:=dm.AqD451RKEY.Value;
  open;
 end;
 DM.tmp.close;
 DM.tmp.sql.text:='select rkey,warehouse_code,abbr_name from data0015';
 DM.tmp.open;
 ComboBox1.Items.Append('所有工厂');
 ComboBox1.ItemIndex:=0;
 i:=0;
 while not DM.tmp.Eof do
 begin
   ComboBox1.Items.Append(DM.tmp.Fields[1].asstring+' '+DM.tmp.Fields[2].asstring);
   FAFc[i]:=DM.tmp.Fields[0].AsInteger;
   inc(i);
   DM.tmp.Next;
 end;
end;

procedure TForm_expense.BitBtn2Click(Sender: TObject);
begin
 try
 form_unfinished:=tform_unfinished.Create(application);
  with form_unfinished.ADOQ50 do
  begin
  close;
  parameters[0].Value:=dm.AqD451ACTUAL_FM_DATE.Value;;
  parameters[1].Value:=dm.AqD451ACTUAL_END_DATE.Value;
  open;
  end;
  if not form_unfinished.ADOQ50.IsEmpty then
   form_unfinished.ShowModal;
  form_unfinished.Free;
 except
 on e :exception do
 begin
  messagedlg(e.Message,mtinformation,[mbok],0);
 end;
end;

end;

procedure TForm_expense.BitBtn1Click(Sender: TObject);

begin
 dm.ADOD424.UpdateBatch();
 self.ModalResult:=mrok;
end;

procedure TForm_expense.DBGridEh1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if (key=40) and             //如果是下箭头如果是最后一条记录
  (dm.ADOD424.RecNo=dm.ADOD424.RecordCount) then abort;

 if key=45 then abort; //insert键

 if (ssCtrl	in shift) and (key=46) then  //用户按下ctrl+del键
  abort

end;

procedure TForm_expense.BitBtn4Click(Sender: TObject);
begin
if dm.ADOD424.IsEmpty then exit;
self.CopyDbDataToExcel([dbgrideh1],Caption);
end;

procedure TForm_expense.ComboBox1Change(Sender: TObject);
begin
  if ComboBox1.ItemIndex=0 then
   DM.ADOD424.Filtered:=false
  else begin
    DM.ADOD424.Filtered:=false;
    DM.ADOD424.Filter:='warehouse_ptr='+inttostr(FAFc[ComboBox1.ItemIndex-1]);
    DM.ADOD424.Filtered:=true;
  end;
end;

procedure TForm_expense.BitBtn5Click(Sender: TObject);
var i: Integer;
    XLApp,Sheet: variant;
begin
 if dm.ADOD424.IsEmpty then exit;
 OpenDialog1.DefaultExt :='*.XLS';
 OpenDialog1.Filter :='*.XLS|*.XLS';
 if OpenDialog1.Execute then
  if messagedlg('从Excel文档导入实际制造费用,原数据将被覆盖，是否继续？',mtconfirmation,[mbyes,mbno],0)=mryes then
  begin
   Screen.Cursor := crHourGlass;
   if not VarIsEmpty(XLApp) then
   begin
    XLApp.DisplayAlerts := False;
    XLApp.Quit;
    VarClear(XLApp);
   end;
  
   try
    XLApp := CreateOleObject('Excel.Application'); //创建OLE对象
   except
    Screen.Cursor := crDefault;
    Exit;
   end;

   try
    XLApp.workBooks.Open(OpenDialog1.FileName);
    Sheet := XLApp.Workbooks[1].WorkSheets[1];
    for i:=2 to xlapp.activesheet.usedrange.rows.count do
     if trim(XLApp.workbooks[1].sheets[1].cells[i,1]) = '' then break
     else begin
//      if dm.ADOD424.Locate('abbr_name;dept_code',
      if dm.ADOD424.Locate('abbr_name;dept_name',
       vararrayof([xlapp.workbooks[1].sheets[1].cells[i,1],
       xlapp.workbooks[1].sheets[1].cells[i,2]]),[]) then
      begin
       dm.ADOD424.Edit;
       dm.ADOD424.FieldByName('ovhd_1').AsString:=xlapp.workbooks[1].sheets[1].cells[i,4];
       dm.ADOD424.FieldByName('ovhd_2').AsString:=xlapp.workbooks[1].sheets[1].cells[i,5];
       dm.ADOD424.Post;
      end;
     end;
    XLApp.workbooks[1].close;
   finally
    XLApp.quit;
    Screen.Cursor := crDefault;
   end
  end;
end;

end.
