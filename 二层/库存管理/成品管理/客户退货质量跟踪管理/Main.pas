unit Main;

interface

uses
 Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Grids, DBGrids, StdCtrls, Buttons, DB, DBGridEh, ADODB,
  Menus;

type
  TForm_Main = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    Panel1: TPanel;
    BitBtn4: TBitBtn;
    ehFrmMain: TDBGridEh;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    edtFilter: TLabeledEdit;
    N2: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure ehFrmMainTitleClick(Column: TColumnEh);
    procedure edtFilterChange(Sender: TObject);
    procedure edtFilterKeyPress(Sender: TObject; var Key: Char);
    procedure N1Click(Sender: TObject);
    procedure ehFrmMainKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure N2Click(Sender: TObject);
  private
    { Private declarations }
        sSql :string;
        FHotColumn: TColumnEh;
  public
    { Public declarations }
  end;

var
  Form_Main: TForm_Main;

implementation

uses demo,common, Condition;

{$R *.dfm}

procedure TForm_Main.FormCreate(Sender: TObject);
begin
if not App_Init(dm.ADOConnection1) then
  begin
    ShowMsg('程序起动失败请联系管理员',1);
    application.Terminate;
  end;

  Caption := application.Title;
//  user_ptr := '3';
//  vprev :='3';
//  dm.ADOConnection1.Open;

  DateSeparator := '-';
  ShortDateFormat := 'yyyy-mm-dd';
end;

procedure TForm_Main.FormShow(Sender: TObject);
begin
dm.ADO98.close;
dm.ADO98.Parameters[0].Value:=common.getsystem_date(dm.ADOQuery1,1)-4;
dm.ADO98.Parameters[1].Value:=common.getsystem_date(dm.ADOQuery1,1)+1;
dm.ado98.open;
sSql:=dm.ADO98.SQL.Text;
ehFrmMainTitleClick(ehFrmMain.Columns[0]);
end;

procedure TForm_Main.BitBtn2Click(Sender: TObject);
begin
dm.ADO98.Close;
dm.ADO98.Open;
end;

procedure TForm_Main.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if (chr(key)='S') and (ssalt in shift) then showmessage(DM.ADO98.SQL.Text);
end;

procedure TForm_Main.BitBtn4Click(Sender: TObject);
var i:integer;
    Sqlstr:string;
begin
  if Form_Condition=nil then  Form_Condition:=TForm_Condition.Create(Application);
  if Form_Condition.ShowModal=mrok then
  begin
    dm.ADO98.Parameters[0].Value:=formatdatetime('YYYY/MM/DD',form_condition.DateTimePicker1.Date);
    dm.ADO98.Parameters[1].Value:=form_condition.DateTimePicker2.Date+1;
    for i:=1 to Form_Condition.sgrid1.RowCount-2 do
      if Form_Condition.sgrid1.Cells[2,i]<> '' then Sqlstr:=sqlstr+Form_Condition.sgrid1.Cells[2,i];
    dm.ADO98.SQL.Text:=sSql+Sqlstr+'order by data0098.rma_number';
    dm.ADO98.Close;
    dm.ADO98.Open;
    ehFrmMain.DataSource:=nil;
    ehFrmMain.DataSource:=dm.DataSource1;
  end;
end;

procedure TForm_Main.BitBtn3Click(Sender: TObject);
begin
Export_dbGridEH_to_Excel(ehFrmMain,Application.MainForm.Caption);
end;

procedure TForm_Main.ehFrmMainTitleClick(Column: TColumnEh);
begin
  FHotColumn := Column;
  edtFilter.EditLabel.Caption := FHotColumn.Title.Caption;
if (Column.Title.SortMarker = smNoneEh) or (Column.Title.SortMarker = smDownEh) then
begin
  TCustomAdoDataSet(Column.Field.DataSet).Sort :=Column.Field.FieldName+' ASC';
  Column.Title.SortMarker := smUpEh;
end
else
if Column.Title.SortMarker = smUpEh then
begin
  TCustomAdoDataSet(Column.Field.DataSet).Sort :=Column.Field.FieldName+' DESC';
  Column.Title.SortMarker := smDownEh;
end ;
end;

procedure TForm_Main.edtFilterChange(Sender: TObject);
var
  tmpstr,sFilter:string;
  DATASET:TCustomADoDATASET;
begin
  DATASET := TCustomAdoDataSet(ehFrmMain.DataSource.DataSet);
  if not DATASET.Active then Exit;
  tmpstr:= trim(edtFilter.Text);
  if TmpStr='' then
  begin
    DATASET.Filtered:= False;
  end else
  begin
    if (FHotColumn.Field.DataType in [ftString,ftWideString,ftMemo]) then
    begin
      sFilter := '*'+uppercase(TmpStr)+'*';
      DATASET.Filter := FHotColumn.Field.FieldName+' Like '+ QuotedStr(sFilter);
      DATASET.Filtered:= true;
    end else
    if FHotColumn.Field.DataType in [ftSmallint, ftInteger, ftWord, ftFloat, ftCurrency, ftBCD,ftLargeint] then
    begin
      try
        StrToFloat(tmpstr);
      except
        DATASET.Filtered := False;
        Exit;
      end;
      sFilter := FHotColumn.Field.FieldName+'>='+TmpStr;
      DATASET.Filter := sFilter;
      DATASET.Filtered:= true;
    end else
    if FHotColumn.Field.DataType in [ftDate, ftDateTime] then
    begin
      try
        tmpstr := FormatDateTime('YYYY-MM-DD hh:mm:ss',StrToDateTime(TmpStr));
      except
        Exit;
      end;
      sFilter := '>='+QuotedStr(TmpStr);
      DATASET.Filter := FHotColumn.Field.FieldName + sFilter;
      DATASET.Filtered:= true;
    end;
  end;
end;

procedure TForm_Main.edtFilterKeyPress(Sender: TObject; var Key: Char);
begin
if FHotColumn.Field.DataType in [ftSmallint, ftInteger, ftWord, ftLargeint] then
  begin
    if (length((Sender as TLabeledEdit).Text)=20) and (key<>chr(8)) then Abort;
    if Key='.' then abort;
    if (pos(key,'-0123456789.')=0) and (key<>chr(8)) then
      Abort;
    if (pos('-',(Sender as TLabeledEdit).Text)>0) and (key='-') then abort;
    if Length((Sender as TLabeledEdit).text)>0 then
      if (key='-') then abort;
  end else
  if  FHotColumn.Field.DataType in [ftFloat, ftCurrency, ftBCD] then
  begin
    if (length((Sender as TLabeledEdit).Text)=20) and (key<>chr(8)) then Abort;
    if (pos('.',(Sender as TLabeledEdit).Text)>0) and (key='.') then abort;
    if (pos(key,'-0123456789.')=0) and (key<>chr(8)) then
      Abort;
    if (pos('-',(Sender as TLabeledEdit).Text)>0) and (key='-') then abort;
    if Length((Sender as TLabeledEdit).text)>0 then
      if (key='-') then abort;
  end ;
end;

procedure TForm_Main.N1Click(Sender: TObject);
begin
 if messagedlg('您确定要确认包装状态吗?',mtConfirmation,[mbyes,mbno],0)=mryes then
 begin
 if dm.ADO98rkey492.Value>0 then
 begin
  with DM.ADOQuery1 do
  begin
  Close;
  sql.Clear;
  sql.Add('update data0492 set confirm_pack=1,confirm_ptr='+user_ptr+',confirm_time=getdate()');
  SQL.Add('where data0492.rkey='+dm.ADO98rkey492.AsString);
  ExecSQL;
  end;
  dm.ADO98.Close;
  dm.ADO98.Open;
 end
 else
 begin
   ShowMessage('退货还没进行投产,不能确认!');
   exit;
 end;
 end;
end;


procedure TForm_Main.ehFrmMainKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if (chr(key)='S') and (ssalt in shift) then showmessage(dm.ADO98.SQL.Text);
end;

procedure TForm_Main.PopupMenu1Popup(Sender: TObject);
begin
 if DM.ADO98.IsEmpty then
 begin
  N1.Enabled:=False;
  N2.Enabled:=False;
 end
 else
 begin
  if DM.ADO98confirm_pack.Value='未确认' then
  N1.Enabled:=True
  else
  N1.Enabled:=False;
  if DM.ADO98confirm_pack.Value='已确认' then
  N2.Enabled:=True
  else
  N2.Enabled:=False;
 end;
end;

procedure TForm_Main.N2Click(Sender: TObject);
begin
 if messagedlg('您确定要取消包装确认吗?',mtConfirmation,[mbyes,mbno],0)=mryes then
 begin
  with dm.ADOQuery1 do
  begin
    Close;
    sql.Clear;
    sql.Add('select FG_QTY from data0492 where rkey='+dm.ADO98rkey492.AsString);
    Open;
  end;
  if dm.ADOQuery1.FieldByName('FG_QTY').Value>0 then
  begin
   MessageDlg('此退货相关投产已有成品入库,不能取消!',mtInformation,[mbok],0);
   Exit;
  end
  else
  begin
   with DM.ADOQuery1 do
   begin
   Close;
   sql.Clear;
   sql.Add('update data0492 set confirm_pack=0,confirm_ptr=null,confirm_time=null');
   SQL.Add('where data0492.rkey='+dm.ADO98rkey492.AsString);
   ExecSQL;
   end;
   dm.ADO98.Close;
   dm.ADO98.Open;
  end;
 end;
end;

end.
