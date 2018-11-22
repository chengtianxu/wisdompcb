unit PR_search;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, Grids, DBGrids, StdCtrls, Buttons, ExtCtrls, ComCtrls,
  Provider, DBClient, DBGridEh;

type
  TForm_req = class(TForm)
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    DataSource2: TDataSource;
    DataSource3: TDataSource;
    DBGrid3: TDBGrid;
    ADOQuery1: TADOStoredProc;
    ADOQuery1RKEY: TIntegerField;
    ADOQuery1PO_REQ_NUMBER: TStringField;
    ADOQuery1abbr_name: TStringField;
    ADOQuery1REQ_DATE: TDateTimeField;
    ADOQuery1FLAG: TStringField;
    ADOQuery1STATUS: TWordField;
    ADOQuery1DEPARTMENT_NAME: TStringField;
    ADOQuery1EMPLOYEE_NAME: TStringField;
    ADOQuery1employee_name_appd: TStringField;
    ADOQuery1WAREHOUSE_NAME: TStringField;
    ADOQuery1WHSE_PTR: TIntegerField;
    ADOQuery1v_flag: TStringField;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Panel1: TPanel;
    Label1: TLabel;
    Edit1: TEdit;
    BitBtn1: TBitBtn;
    Panel2: TPanel;
    Button1: TButton;
    Button2: TButton;
    Panel3: TPanel;
    DBGrid2: TDBGrid;
    Splitter1: TSplitter;
    DBGridEh1: TDBGridEh;
    DataSource4: TDataSource;
    ClientDataSet1: TClientDataSet;
    DataSetProvider1: TDataSetProvider;
    ADODataSet1: TADODataSet;
    ClientDataSet1IsSelected: TBooleanField;
    ClientDataSet1INV_PART_NUMBER: TStringField;
    ClientDataSet1INV_NAME: TStringField;
    ClientDataSet1INV_DESCRIPTION: TStringField;
    ClientDataSet1extra_req: TStringField;
    ClientDataSet1ABBR_NAME: TStringField;
    ClientDataSet1CURR_NAME: TStringField;
    ClientDataSet1UNIT_NAME: TStringField;
    ClientDataSet1QUANTITY: TFloatField;
    ClientDataSet1tax_price: TFloatField;
    ClientDataSet1tax: TFloatField;
    ClientDataSet1reply_date: TDateTimeField;
    ClientDataSet1PO_REQ_NUMBER: TStringField;
    ClientDataSet1abbr_name15: TStringField;
    ClientDataSet1SUPP_PTR: TIntegerField;
    ClientDataSet1PO_LINK_PTR: TIntegerField;
    ClientDataSet1BASE_TO_OTHER: TFloatField;
    ClientDataSet1o_i_flag: TSmallintField;
    ClientDataSet1CODE: TStringField;
    ClientDataSet1WHSE_PTR: TIntegerField;
    ClientDataSet1INVT_PTR: TIntegerField;
    ClientDataSet1UNIT_PTR: TIntegerField;
    ClientDataSet1UNIT_PRICE: TFloatField;
    ClientDataSet1CONVERSION_FACTOR: TFloatField;
    ClientDataSet1reason: TStringField;
    ClientDataSet1avl_flag: TStringField;
    ClientDataSet1rohs: TStringField;
    ClientDataSet1req_unit_ptr: TIntegerField;
    ClientDataSet1IF_CAF: TWideStringField;
    ClientDataSet1RKEY: TIntegerField;
    ADODataSet1IsSelected: TBooleanField;
    ADODataSet1INV_PART_NUMBER: TStringField;
    ADODataSet1INV_NAME: TStringField;
    ADODataSet1INV_DESCRIPTION: TStringField;
    ADODataSet1extra_req: TStringField;
    ADODataSet1ABBR_NAME: TStringField;
    ADODataSet1CURR_NAME: TStringField;
    ADODataSet1UNIT_NAME: TStringField;
    ADODataSet1QUANTITY: TFloatField;
    ADODataSet1tax_price: TFloatField;
    ADODataSet1tax: TFloatField;
    ADODataSet1reply_date: TDateTimeField;
    ADODataSet1PO_REQ_NUMBER: TStringField;
    ADODataSet1abbr_name15: TStringField;
    ADODataSet1SUPP_PTR: TIntegerField;
    ADODataSet1PO_LINK_PTR: TIntegerField;
    ADODataSet1BASE_TO_OTHER: TFloatField;
    ADODataSet1o_i_flag: TWordField;
    ADODataSet1CODE: TStringField;
    ADODataSet1WHSE_PTR: TIntegerField;
    ADODataSet1INVT_PTR: TIntegerField;
    ADODataSet1UNIT_PTR: TIntegerField;
    ADODataSet1UNIT_PRICE: TFloatField;
    ADODataSet1CONVERSION_FACTOR: TFloatField;
    ADODataSet1reason: TStringField;
    ADODataSet1avl_flag: TStringField;
    ADODataSet1rohs: TStringField;
    ADODataSet1req_unit_ptr: TIntegerField;
    ADODataSet1IF_CAF: TWideStringField;
    ADODataSet1RKEY: TIntegerField;
    ADODataSet1flag_oi: TStringField;
    ClientDataSet1flag_oi: TStringField;
    ADODataSet1FLAG: TStringField;
    ADODataSet1V_FLAG: TStringField;
    ClientDataSet1FLAG: TStringField;
    ClientDataSet1V_FLAG: TStringField;
    CheckBox1: TCheckBox;
    ADODataSet1WAREHOUSE_NAME: TStringField;
    ClientDataSet1WAREHOUSE_NAME: TStringField;
    ADODataSet1IF_urgency: TBooleanField;
    ClientDataSet1IF_urgency: TBooleanField;
    ADODataSet1DEPARTMENT_NAME: TStringField;
    ClientDataSet1DEPARTMENT_NAME: TStringField;
    ADODataSet1EMPLOYEE_NAME: TStringField;
    ClientDataSet1EMPLOYEE_NAME: TStringField;
    ADODataSet1ORIG_ABBRNAME: TStringField;
    ClientDataSet1ORIG_ABBRNAME: TStringField;
    procedure DBGrid1DblClick(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn1Click(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure DataSource1DataChange(Sender: TObject; Field: TField);
    procedure FormCreate(Sender: TObject);
    procedure ADOQuery1CalcFields(DataSet: TDataSet);
    procedure DBGridEh1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGridEh1TitleClick(Column: TColumnEh);
    procedure CheckBox1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
    PreColumn: TColumnEh;
  public
    { Public declarations }
  end;

var
  Form_req: TForm_req;

implementation
 uses damo, common;
{$R *.dfm}

procedure TForm_req.DBGrid1DblClick(Sender: TObject);
begin
if not adoquery1.IsEmpty then ModalResult := mrok;
end;

procedure TForm_req.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if (key=13) and (not adoquery1.IsEmpty) then ModalResult := mrok;
 if (chr(key)='S') and (ssalt in shift) then
  showmessage(adoquery1.ProcedureName);
end;

procedure TForm_req.BitBtn1Click(Sender: TObject);
begin
 edit1.Text := '';
 edit1.SetFocus;
end;

procedure TForm_req.Edit1Change(Sender: TObject);
begin
if self.PageControl1.ActivePageIndex=0 then
 begin
  IF trim(EDIT1.TEXT)<>'' THEN
   ADOQUERY1.Filter := 'PO_REQ_NUMBER like ''%'+trim(edit1.text)+'%'''
  ELSE
   ADOQUERY1.FILTER := '';

   if adoquery1.IsEmpty then
    button1.Enabled := false
   else
    button1.Enabled := true;
 end
else
 begin
  IF trim(EDIT1.TEXT)<>'' THEN
   ClientDataSet1.Filter :=PreColumn.FieldName+ ' like ''%'+trim(edit1.text)+'%'''
  ELSE
   ClientDataSet1.FILTER := '';

  if ClientDataSet1.IsEmpty then
   button1.Enabled := false
  else
   button1.Enabled := true;

 end;
end;

procedure TForm_req.DataSource1DataChange(Sender: TObject; Field: TField);
begin
 if (adoquery1flag.Value='S')  then
  with dm.ADo0069 do
   begin             //查找标准采购条目
    active:=false;
    Parameters[1].Value := self.ADOQuery1RKEY.Value;
    active:=true;
    self.DBGrid3.Visible := false;
    self.dbgrid2.Visible := true;
   end
 else
  with dm.ADo0204 do
   begin           //查找杂项采购条目
    active:=false;
    Parameters[1].Value := self.ADOQuery1RKEY.Value;
    active:=true;
    self.dbgrid2.Visible := false;
    self.dbgrid3.Visible := true;
   end;
  
end;

procedure TForm_req.FormCreate(Sender: TObject);
var
  LOP: TIndexOptions;
begin
 with ADOQuery1 do
  begin
   active := false;
   Parameters[1].Value := user_ptr;
   active := true;
  end;

 ADODataSet1.Close;
 ADODataSet1.Parameters[0].Value:=user_ptr;
 ADODataSet1.Parameters[1].Value:=user_ptr;
 ADODataSet1.Open;

 ClientDataSet1.Data:=self.DataSetProvider1.Data;

// ClientDataSet1.Close;
// ClientDataSet1.Open;
 ADODataSet1.Close;

  PreColumn:=DBGridEh1.Columns[1];
  LOP := [];
  ClientDataSet1.IndexDefs.Update;
  if ClientDataSet1.IndexDefs.IndexOf('index1') >= 0 then
  ClientDataSet1.DeleteIndex('index1');
  ClientDataSet1.AddIndex('index1', PreColumn.FieldName, LOP, '');
  ClientDataSet1.IndexName := 'index1';
end;

procedure TForm_req.ADOQuery1CalcFields(DataSet: TDataSet);
begin
 if adoquery1flag.Value='S' then
  Adoquery1v_flag.Value :='生产物料'
 else
  if adoquery1flag.Value='M' then
   Adoquery1v_flag.Value :='非生产物料';
end;

procedure TForm_req.DBGridEh1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if (key=40) and        //如果是下箭头如果是最后一条记录
  (Self.ClientDataSet1.RecNo=Self.ClientDataSet1.RecordCount) then abort;

 if key=45 then abort; //insert键
 if (key=46) and (ssCtrl in shift) then abort;//删除记录

if (chr(key)='S') and (ssalt in shift) then
  showmessage(ADODataSet1.CommandText);

end;

procedure TForm_req.DBGridEh1TitleClick(Column: TColumnEh);
var
  LOP: TIndexOptions;
begin

  if column.Title.SortMarker =smDownEh then
  begin
   column.Title.SortMarker:=smUpEh;
   lop:=[];
  end
  else
  begin
   column.Title.SortMarker:=smDownEh;
   LOP := [ixDescending];
  end;
  ClientDataSet1.IndexDefs.Update;
  if ClientDataSet1.IndexDefs.IndexOf('index1') >= 0 then
  ClientDataSet1.DeleteIndex('index1');
  ClientDataSet1.AddIndex('index1', Column.FieldName, LOP, '');
  ClientDataSet1.IndexName := 'index1';

if (PreColumn.FieldName<>column.FieldName) and
   (column.Field.DataType in [ftString,ftWideString]) then
 begin
  label1.Caption := column.Title.Caption;
  edit1.SetFocus;
  PreColumn.Title.Color := clBtnFace;
  Column.Title.Color := clred;
  PreColumn := column;
 end
else
 edit1.SetFocus;
end;

procedure TForm_req.CheckBox1Click(Sender: TObject);
var
  BookMark:Tbookmark;
begin
if not ClientDataSet1.IsEmpty then
 begin
  BookMark:=ClientDataSet1.GetBookmark();
   with  ClientDataSet1 do
   begin
    DisableControls;
    First;
    while not Eof do
    begin
      Edit;
      ClientDataSet1IsSelected.Value:=CheckBox1.Checked;
      Next;
    end;
    EnableControls;
   end;
   if BookMark<>nil then
   begin
    ClientDataSet1.GotoBookmark(BookMark);
    ClientDataSet1.FreeBookmark(BookMark);
   end;
 end;

end;

procedure TForm_req.Button1Click(Sender: TObject);
var
 popo_number:array of array of Integer;
 i,j:Integer;
 find_error:Boolean;
 c_filter:string;
begin
if PageControl1.ActivePageIndex =0 then
 ModalResult:=mrOk
else
 begin
  if ClientDataSet1.Filter<>'' then
   c_filter:=ClientDataSet1.Filter
  else
   c_filter:='';
  ClientDataSet1.Filter:='IsSelected=1';
  ClientDataSet1.First;

  if ClientDataSet1.IsEmpty then
  begin
    ShowMsg('必须选择一条以上请购明细!',1);
     ClientDataSet1.Filter:='';
    Exit;
  end;
  setlength(popo_number,ClientDataSet1.RecordCount,5);//设置数组下标个数
  ClientDataSet1.DisableControls;
  i:=0;
  find_error:=False;
  while not ClientDataSet1.eof do
  begin
   popo_number[i,0]:=ClientDataSet1SUPP_PTR.Value;
   popo_number[i,1]:=ClientDataSet1PO_LINK_PTR.Value;
   popo_number[i,2]:=ClientDataSet1o_i_flag.Value;
   if ClientDataSet1FLAG.Value='S' then
    popo_number[i,3]:=0
   else
    popo_number[i,3]:=1;
   popo_number[i,4]:=ClientDataSet1WHSE_PTR.Value;
   Inc(i);    //   i:=i+1;
   ClientDataSet1.Next;
  end;

 for i:=low(popo_number) to high(popo_number)-1  do
  begin
   for j:=i+1 to high(popo_number) do
   if (popo_number[i,0]<>popo_number[j,0]) or   //二维数组的下标第一个为行，第二个为列
      (popo_number[i,1]<>popo_number[j,1]) or   //stringgrid的下标，正好相反
      (popo_number[i,2]<>popo_number[j,2]) or
      (popo_number[i,3]<>popo_number[j,3]) or
      (popo_number[i,4]<>popo_number[j,4]) then
   begin
    find_error:=True;
    break;
   end;
  end;
  ClientDataSet1.EnableControls;
  ClientDataSet1.First;

  if find_error then
   begin
    ShowMsg('选择错误！必须同一供应商，同一货币，同一类型，同一格式，同一工厂',1);
    ClientDataSet1.Filter:=c_filter;
   end
  else
   ModalResult:=mrOk;

 end;
end;

end.
