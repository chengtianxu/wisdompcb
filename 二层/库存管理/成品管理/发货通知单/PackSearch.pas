unit PackSearch;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Grids, DBGrids, Buttons, DB, ComCtrls;

type
  TForm_PackSearch = class(TForm)
    Label1: TLabel;
    Edit1: TEdit;
    DBGrid1: TDBGrid;
    Panel1: TPanel;
    Button1: TButton;
    Button2: TButton;
    BtnBrush: TBitBtn;
    DataSource1: TDataSource;
    Label2: TLabel;
    Label4: TLabel;
    Label3: TLabel;
    dtpk1: TDateTimePicker;
    dtpk2: TDateTimePicker;
    procedure Button1Click(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure Edit1Change(Sender: TObject);
    procedure Edit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure dtpk1Exit(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_PackSearch: TForm_PackSearch;

implementation

uses Demo, PackList,common;

{$R *.dfm}

procedure TForm_PackSearch.Button1Click(Sender: TObject);
var
 i:byte;
begin
if dm.ADO64.IsEmpty=True then
begin
  Exit;
end;
with Form_PackList do
 begin
  for i := 1 to stringgrid2.RowCount-2 do //比较是否重复
  if strtoint(stringgrid2.Cells[0,i])=dm.ADO64rkey64.Value then
   begin
    messagedlg('该批指派已在装箱单中!',mtinformation,[mbok],0);
    exit;
   end;
 end;

 if (dm.ADO529SHIP_ADDR_PTR.Value>0)and(dm.ADO529SHIP_ADDR_PTR.Value<>dm.ADO64CUST_SHIP_ADDR_PTR.Value) then
 begin
  if messagedlg('装箱单中的地址与SO中的地址不一致,是否继续?',mtconfirmation,[mbyes,mbno],0)<>mryes then
   exit;
 end;

 if (Form_PackList.po_number<>'')and(Form_PackList.po_number<>dm.ADO64PO_NUMBER.Value) then
 begin
  if messagedlg('现有订单客户订单号与被选择订单的客户订单号不一致,是否继续?',mtconfirmation,[mbyes,mbno],0)<>mryes then
   exit;
 end;
 Form_PackSearch.ModalResult:=mrok;
end;

procedure TForm_PackSearch.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if (chr(key)='S') and (ssalt in shift) then showmessage(dm.ADO64.SQL.Text);
 if (key=13) and (not dm.ADO64.IsEmpty) then  button1click(sender);
end;

procedure TForm_PackSearch.DBGrid1TitleClick(Column: TColumn);
begin
if (column.FieldName<>'QUAN_SHIPPED') and
   (column.FieldName<>'SHIPMENT_NO')  then
 begin
  label1.Caption:=column.Title.Caption;
  label2.Caption:=column.FieldName;
  edit1.SetFocus;
  edit1.Text:='';
 end;
end;

procedure TForm_PackSearch.Edit1Change(Sender: TObject);
begin
if trim(edit1.Text)<>'' then
 DM.ADO64.Filter:= label2.Caption+' like '''+trim(edit1.Text)+'%'''
else
 dm.ADO64.Filter:='';
 Button1.Enabled:=not dm.ADO64.IsEmpty;
end;

procedure TForm_PackSearch.Edit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key=13 then button1click(sender);
end;

procedure TForm_PackSearch.FormActivate(Sender: TObject);
begin
if dm.ADO64.Filter<>'' then dm.ADO64.Filter:='';
end;

procedure TForm_PackSearch.FormCreate(Sender: TObject);
begin
  dtpk2.Date := common.getsystem_date(dm.ADOQuery1,1);
  dtpk1.Date := dtpk2.Date-1;
end;

procedure TForm_PackSearch.dtpk1Exit(Sender: TObject);
begin
 dm.ADO64.Close;
 dm.ADO64.Parameters[1].Value := dtpk1.Date;
 dm.ADO64.Parameters[2].Value := dtpk2.Date+1;
 dm.ADO64.Prepared;
 dm.ADO64.Open;
 Button1.Enabled:=not dm.ADO64.IsEmpty;
end;

procedure TForm_PackSearch.FormShow(Sender: TObject);
begin
  Button1.Enabled:=not dm.ADO64.IsEmpty;
end;

end.
