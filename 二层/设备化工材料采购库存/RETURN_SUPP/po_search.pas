unit po_search;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, Buttons, DB, ADODB, ExtCtrls;
type
  TForm2 = class(TForm)
    DBGrid1: TDBGrid;
    Button1: TButton;
    Button2: TButton;
    DataSource1: TDataSource;
    AQ70: TADOStoredProc;
    AQ70RKEY: TIntegerField;
    AQ70PO_NUMBER: TStringField;
    AQ70CONFIRMATION_NUMBER: TStringField;
    AQ70PO_DATE: TDateTimeField;
    AQ70po_type: TStringField;
    AQ70status: TWordField;
    AQ70CODE: TStringField;
    AQ70SUPPLIER_NAME: TStringField;
    AQ70WAREHOUSE_CODE: TStringField;
    AQ70WAREHOUSE_NAME: TStringField;
    AQ70FACTORY_LOCATION: TStringField;
    AQ70v_status: TStringField;
    AQ70v_type: TStringField;
    Panel1: TPanel;
    Panel2: TPanel;
    Label1: TLabel;
    Edit1: TEdit;
    BitBtn1: TBitBtn;
    Splitter1: TSplitter;
    DBGrid2: TDBGrid;
    ADO0071: TADOQuery;
    DataSource2: TDataSource;
    ADO0071INV_NAME: TStringField;
    ADO0071INV_DESCRIPTION: TStringField;
    ADO0071QUAN_ORD: TFloatField;
    ADO0071PRICE: TFloatField;
    ADO0071extra_req: TStringField;
    ADO0071UNIT_NAME: TStringField;
    ADO0071QUAN_RECD: TBCDField;
    procedure Edit1Change(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure AQ70CalcFields(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure DBGrid1TitleClick(Column: TColumn);
  private
    { Private declarations }
   file_name:string; 
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation
uses damo;
{$R *.dfm}

procedure TForm2.Edit1Change(Sender: TObject);
begin
 IF trim(EDIT1.TEXT)<>'' THEN
  AQ70.Filter := self.file_name+' like ''%'+trim(edit1.text)+'%'''
 ELSE
  AQ70.FILTER := '';

if aq70.IsEmpty then
 button1.Enabled:=false
else
 button1.Enabled:=true;
end;

procedure TForm2.BitBtn1Click(Sender: TObject);
begin
 edit1.Text := '';
 edit1.SetFocus;
end;

procedure TForm2.DBGrid1DblClick(Sender: TObject);
begin
if not aq70.IsEmpty then
 ModalResult := mrok;
end;

procedure TForm2.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if (key=13) and (not aq70.IsEmpty) then ModalResult := mrok;
end;

procedure TForm2.AQ70CalcFields(DataSet: TDataSet);
begin
 case AQ70status.Value of
   1: AQ70v_status.Value := '待审核';
   2: AQ70v_status.Value := '被退回';
   3: AQ70v_status.Value := '已保留';
   4: AQ70v_status.Value := '已暂缓';
   5: AQ70v_status.Value := '已审核';
   6: AQ70v_status.Value := '已收货';
   7: AQ70v_status.Value := '已完成';
   8: AQ70v_status.Value := '未提交';
 end;

 if AQ70PO_TYPE.Value = 'S' then
  AQ70v_type.Value := '生产物料'
 else
  if AQ70PO_TYPE.Value = 'M' then
   AQ70v_type.Value := '非生产物料'
  else
   AQ70v_type.Value := '外发加工';
end;

procedure TForm2.FormCreate(Sender: TObject);
begin

 aq70.Open;
 ado0071.Open;
 file_name:='PO_NUMBER';
end;

procedure TForm2.DBGrid1TitleClick(Column: TColumn);
begin
if (column.FieldName<>'PO_DATE') and
   (column.FieldName<>'v_status') and
   (column.FieldName<>'v_type')  and
   (column.FieldName<>file_name) then
 begin
  file_name:=column.FieldName;
  label1.Caption:=column.Title.Caption;
  edit1.SetFocus;
 end;
end;

end.
