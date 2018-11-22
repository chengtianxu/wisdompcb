unit outsql;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, Grids, DBGrids, StdCtrls, ExtCtrls,ComObj, Excel2000,ClipBrd,
  Menus;

type
  TForm3 = class(TForm)
    ado207: TADOQuery;
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    Panel1: TPanel;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Edit1: TEdit;
    Label1: TLabel;
    Label3: TLabel;
    Edit3: TEdit;
    ado207number: TStringField;
    ado207type: TStringField;
    ado207status: TWordField;
    ado207EMPL_CODE: TStringField;
    ado207EMPLOYEE_NAME: TStringField;
    ado207sys_date: TDateTimeField;
    ado207quantity221: TIntegerField;
    ado207auth_EMPL_CODE: TStringField;
    ado207auth_EMPLOYEE_NAME: TStringField;
    ado207auth_date: TDateTimeField;
    ado207reference221: TStringField;
    ado207quantity222: TIntegerField;
    ado207reference222: TStringField;
    ado207INV_PART_NUMBER: TStringField;
    ado207INV_PART_DESCRIPTION: TStringField;
    ado207LOCATION_CODE: TStringField;
    ado207LOCATION_NAME: TStringField;
    ado207OH_degree: TWordField;
    ado207CODE: TStringField;
    ado207SUPPLIER_NAME: TStringField;
    ado207ABBR_NAME: TStringField;
    PopupMenu2: TPopupMenu;
    Button4: TButton;
    procedure Button1Click(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure Button3Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Edit3Change(Sender: TObject);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure Button2Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
    field_name:string;
    procedure NClick(Sender: TObject);
  public
    { Public declarations }
  end;

var
  Form3: TForm3;

implementation
uses main, invt_report;
{$R *.dfm}

procedure TForm3.Button1Click(Sender: TObject);
begin
 close;
end;

procedure TForm3.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if (chr(key)='S') and (ssalt in shift) then
  showmessage(ado207.SQL.Text);
end;

procedure TForm3.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  form1.Show;
end;

procedure TForm3.Button3Click(Sender: TObject);
begin
 try
  form_report:=tform_report.Create(application);
  ado207.DisableControls;       //切断与DBgrid控件的联系加快显示速度
  form_report.ppReport3.Print;
  ado207.EnableControls;
 finally
  form_report.free;
 end;
end;

procedure TForm3.FormCreate(Sender: TObject);
begin
field_name:='number';
end;

procedure TForm3.Edit3Change(Sender: TObject);
begin
if trim(edit3.Text)<>'' then
 Ado207.Filter := field_name+' like ''%'+Trim(Edit3.Text)+'%'''
else
 ado207.Filter := '';
end;

procedure TForm3.DBGrid1TitleClick(Column: TColumn);
begin
  edit3.Clear;
  if (column.ReadOnly) and (column.FieldName<>field_name) then
  begin
    field_name:=column.FieldName;
    label3.Caption := column.Title.Caption;
    edit3.SetFocus;
    ado207.Sort:=column.FieldName+' ASC';
  end;
end;

procedure TForm3.Button2Click(Sender: TObject);
begin
form1.CopyDbDataToExcel([dbgrid1],self.Caption);
end;

procedure TForm3.Button4Click(Sender: TObject);
begin
  popupmenu2.Popup(mouse.CursorPos.x,mouse.CursorPos.y);
end;

procedure TForm3.FormActivate(Sender: TObject);
var
 i:byte;
 item:TMenuItem;
begin
  for i:=1 to dbgrid1.FieldCount do
  begin
    item:=TmenuItem.Create(self);
    item.Caption:=dbgrid1.Columns[i-1].Title.Caption;
    if dbgrid1.Columns[i-1].Visible then
      item.Checked:=true;
    item.OnClick:=NClick;
    PopupMenu2.Items.Add(item);
  end;
end;

procedure TForm3.NClick(Sender: TObject);
var
 i:byte;
begin
  (sender as tmenuItem).Checked := not ((sender as tmenuItem).Checked);
  for i:=0 to dbgrid1.FieldCount-1 do
    if dbgrid1.Columns[i].Title.Caption=(sender as tmenuItem).Caption then
    begin
      dbgrid1.Columns[i].Visible:=(sender as tmenuItem).Checked;
      break;
    end;
end;

end.
