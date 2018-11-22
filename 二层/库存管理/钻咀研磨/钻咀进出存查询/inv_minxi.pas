unit inv_minxi;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, Grids, DBGrids, StdCtrls, ExtCtrls,ComObj, Excel2000, ClipBrd,
  Menus, Buttons;

type
  TForm9 = class(TForm)
    Panel1: TPanel;
    Label3: TLabel;
    Button1: TButton;
    Button2: TButton;
    Edit3: TEdit;
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    ado0022: TADOQuery;
    BitBtn5: TBitBtn;
    PopupMenu1: TPopupMenu;
    Label1: TLabel;
    Edit1: TEdit;
    ado0022GRN_NUMBER: TStringField;
    ado0022CREATE_DATE: TDateTimeField;
    ado0022SYSTEM_DATE: TDateTimeField;
    ado0022EMPL_CODE: TStringField;
    ado0022EMPLOYEE_NAME: TStringField;
    ado0022handle_name: TStringField;
    ado0022REMARK219: TStringField;
    ado0022INV_PART_NUMBER: TStringField;
    ado0022INV_PART_DESCRIPTION: TStringField;
    ado0022CODE: TStringField;
    ado0022SUPPLIER_NAME: TStringField;
    ado0022ABBR_NAME: TStringField;
    ado0022LOCATION_CODE: TStringField;
    ado0022LOCATION_NAME: TStringField;
    ado0022OH_degree: TWordField;
    ado0022QUANTITY: TIntegerField;
    ado0022QUAN_RETURNED: TIntegerField;
    ado0022QUAN_SCRAPPED: TIntegerField;
    ado0022QUAN_ON_HAND: TIntegerField;
    ado0022QUAN_ALLOC: TIntegerField;
    ado0022REMARK220: TStringField;
    Label2: TLabel;
    Edit2: TEdit;
    procedure Button1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Edit3Change(Sender: TObject);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn5Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure Edit2KeyPress(Sender: TObject; var Key: Char);
    procedure Edit2Change(Sender: TObject);
  private
    { Private declarations }
    field_name:string;
    procedure item_click(sender:TObject);
    procedure TotalSum;   
  public
    { Public declarations }
  end;

var
  Form9: TForm9;

implementation

uses main;

{$R *.dfm}

procedure TForm9.Button1Click(Sender: TObject);
begin
 close;
end;

procedure TForm9.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  form1.Show;
end;

procedure TForm9.Button2Click(Sender: TObject);
begin
 form1.CopyDbDataToExcel([dbgrid1],self.Caption);
end;

procedure TForm9.FormCreate(Sender: TObject);
begin
  field_name:='INV_PART_NUMBER';
end;

procedure TForm9.Edit3Change(Sender: TObject);
begin
  if (trim(edit3.Text)<>'') then
    begin
      if (trim(edit2.Text)<>'') then
        Ado0022.Filter := field_name+' like ''%'+Trim(Edit3.Text)+'%'' AND OH_degree='+trim(edit2.Text)
      else
        Ado0022.Filter := field_name+' like ''%'+Trim(Edit3.Text)+'%''';
    end
  else
    begin
      if (trim(edit2.Text)<>'') then
        Ado0022.Filter := 'OH_degree='+trim(edit2.Text)
      else
        ado0022.filter := '';
    end;
  TotalSum;
end;

procedure TForm9.DBGrid1TitleClick(Column: TColumn);
begin
 Edit3.Text:='';
 if (column.ReadOnly=true) and
    (column.FieldName<>field_name) then
 begin
  field_name:=column.FieldName;
  label3.Caption := column.Title.Caption;
  edit3.SetFocus;
  ado0022.sort:=column.FieldName+' ASC';
 end;
end;

procedure TForm9.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (chr(key)='S') and (ssalt in shift) then showmessage(ado0022.SQL.Text);
  if (ssCtrl in shift) and (key=46) then  abort;
  if (ssAlt in shift) and (key=45) then abort;
end;

procedure TForm9.BitBtn5Click(Sender: TObject);
begin
  popupmenu1.Popup(mouse.CursorPos.x,mouse.CursorPos.y);
end;

procedure TForm9.item_click(sender:TObject);
var
 i:byte;
begin
(sender as tmenuItem).Checked := not ((sender as tmenuItem).Checked);
if (sender as tmenuItem).Checked then
 begin
  for i:=0 to dbgrid1.FieldCount-1 do
  if dbgrid1.Columns[i].Title.Caption=(sender as tmenuItem).Caption then
   begin
    dbgrid1.Columns[i].Visible:=true;
    break;
   end;
 end
else
 begin
  for i:=0 to dbgrid1.FieldCount-1 do
  if dbgrid1.Columns[i].Title.Caption=(sender as tmenuItem).Caption then
   begin
    dbgrid1.Columns[i].Visible:=false;
    break;
   end;
 end;
end;

procedure TForm9.FormActivate(Sender: TObject);
var
  i:byte;
  item:TMenuItem;
begin
  for i:=1 to dbgrid1.FieldCount do
  begin
    item:=TmenuItem.Create(self);
    item.Caption:=dbgrid1.Columns[i-1].Title.Caption;
    if dbgrid1.Columns[i-1].Visible then item.Checked:=true;
    item.OnClick:=item_click;
    PopupMenu1.Items.Add(item);
  end;
end;

procedure TForm9.Edit2KeyPress(Sender: TObject; var Key: Char);
begin
  if not (key in ['0'..'9',#8]) then
    key:=#0;
end;

procedure TForm9.Edit2Change(Sender: TObject);
begin
  if trim(edit3.Text)<>'' then
    begin
      if trim(edit2.Text)<>'' then
        ado0022.Filter:=field_name+' like ''%'+Trim(Edit3.Text)+'%'' AND OH_degree='+trim(edit2.Text)
      else
        ado0022.Filter:=field_name+' like ''%'+Trim(Edit3.Text)+'%''';
    end
  else
    begin
      if trim(edit2.Text)<>'' then
        ado0022.Filter:='OH_degree='+trim(edit2.Text)
      else
        ado0022.Filter:='';
    end;

  TotalSum;
  edit2.SelectAll;
end;

procedure TForm9.TotalSum;
var
  quantity:integer;
begin
  quantity:=0;
  form9.ado0022.DisableControls;
  form9.DataSource1.DataSet:=nil;
  while not form9.ado0022.Eof do
   begin
    quantity:=quantity+form9.ado0022QUAN_ON_HAND.Value;
    form9.ado0022.Next;
   end;
  form9.ado0022.First;
  form9.DataSource1.DataSet:=form9.ado0022;
  form9.ado0022.EnableControls;
  form9.Edit1.Text:=formatfloat('0.00',quantity);
end;

end.
