unit flowpara_edit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, DBCtrls, Grids, DBGrids, Mask,
  Menus;

type
  TForm_flowpara = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    DBGrid1: TDBGrid;
    DBComboBox1: TDBComboBox;
    BitBtn1: TBitBtn;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    Label2: TLabel;
    DBText1: TDBText;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    DBText2: TDBText;
    DBEdit4: TDBEdit;
    Label4: TLabel;
    DBMemo1: TDBMemo;
    DBNavigator1: TDBNavigator;
    DBEdit5: TDBEdit;
    Label5: TLabel;
    DBCheckBox1: TDBCheckBox;
    CheckBox1: TCheckBox;
    Label6: TLabel;
    DBEdit6: TDBEdit;
    Label7: TLabel;
    BitBtn2: TBitBtn;
    procedure CheckBox1Click(Sender: TObject);
    procedure DBNavigator1Click(Sender: TObject; Button: TNavigateBtn);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure DBGrid1ColExit(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure DBComboBox1KeyPress(Sender: TObject; var Key: Char);
    procedure DBComboBox1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
   OldGridWnd : TWndMethod;
   procedure NewGridWnd (var Message : TMessage);
   procedure  get_value(rkey278:integer);
  public
    { Public declarations }
  end;
type
 TMyDBGrid=class(TDBGrid);

var
  Form_flowpara: TForm_flowpara;

implementation

uses dm;

{$R *.dfm}
procedure TForm_flowpara.NewGridWnd(var Message: TMessage);
var
 IsNeg : Boolean;
begin
 if Message.Msg = WM_MOUSEWHEEL then
 begin
   IsNeg := Short(Message.WParamHi) < 0;
   if IsNeg then
     DBGrid1.DataSource.DataSet.MoveBy(1)
   else
     DBGrid1.DataSource.DataSet.MoveBy(-1)
 end
 else
   OldGridWnd(Message);
end;

procedure  TForm_flowpara.get_value(rkey278:integer);
begin
  with dmcon.ADOQuery1 do
   begin
    close;
    sql.Clear;
    sql.Add('select tvalue from data0338 where parameter_ptr='+inttostr(rkey278));
    open;
   end;
  if not dmcon.adoquery1.IsEmpty then
   begin
    DBComboBox1.Items.Clear;
    while not dmcon.adoquery1.eof do
     begin
      DBComboBox1.Items.Add(trim(dmcon.adoquery1.FieldValues['tvalue']));
      dmcon.adoquery1.Next;
     end;
   end
  else
   DBComboBox1.Items.Clear;
end;

procedure TForm_flowpara.CheckBox1Click(Sender: TObject);
begin
if checkbox1.Checked then
 begin
  dmcon.ads494.Filter:='step_number='+dmcon.ADS38STEP_NUMBER.AsString;
//  if dbedit4.Enabled then dbgrid1.PopupMenu:=PopupMenu1;
 end
else
 begin
  dmcon.ads494.Filter:='';
  dbgrid1.PopupMenu:=nil;
 end;
end;

procedure TForm_flowpara.DBNavigator1Click(Sender: TObject;
  Button: TNavigateBtn);
begin
 CheckBox1Click(sender);
end;

procedure TForm_flowpara.DBGrid1CellClick(Column: TColumn);
begin
if column.Index<5 then dbgrid1.SelectedIndex:=5;

end;

procedure TForm_flowpara.DBGrid1ColExit(Sender: TObject);
begin
If DBGrid1.SelectedField.FieldName = DBComboBox1.DataField then
 DBComboBox1.Visible := false;
end;

procedure TForm_flowpara.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
if (gdFocused in State) then
 begin
  if (column.FieldName = DBComboBox1.DataField ) then
   begin
    DBComboBox1.Left := Rect.Left+1;
    DBComboBox1.Top := Rect.Top+2;
    DBComboBox1.Width := Rect.Right - Rect.Left+3;
    DBComboBox1.Height := Rect.Bottom - Rect.Top;
    self.get_value(dmcon.ads494PARAMETER_PTR.Value);
    if dbcombobox1.Items.Count > 0 then
     DBComboBox1.Visible := True
    else
     DBComboBox1.Visible := false;
   end;
 end;


 with TMyDBGrid(Sender) do
 begin
  if DataLink.ActiveRecord=Row-1 then
   begin
    Canvas.Font.Color:=clWhite;
    Canvas.Brush.Color:=$00800040;
   end
  else
   begin
    Canvas.Brush.Color:=Color;
    Canvas.Font.Color:=Font.Color;
   end;

  if dmcon.ads494flow_spfc_flag.Value='Y' then
   Canvas.Font.Color := clred;
   
  DefaultDrawColumnCell(Rect,DataCol,Column,State);
 end;
end;

procedure TForm_flowpara.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if (key=40) and        //如果是下箭头如果是最后一条记录
  (dmcon.ads494.RecNo = dmcon.ads494.RecordCount) then abort;

 if key=45 then abort; //insert键

 if (key=46) and (ssCtrl in shift) then abort;//删除记录

 if (key=112) and
    (dbcombobox1.Visible) and
    (dbcombobox1.Enabled) then
  begin                         //F1键出现下拉
   dbcombobox1.SetFocus;
   dbcombobox1.DroppedDown := true;
  end;
end;

procedure TForm_flowpara.DBGrid1KeyPress(Sender: TObject; var Key: Char);
begin
 if dmcon.ads494DATATYPE.Value='数字' then
 if not (key in ['0'..'9','.',#8,#13]) then  //判断是否输入数字
  abort;

if (key <> chr(9)) then
 begin
  if (DBGrid1.SelectedField.FieldName =DBComboBox1.DataField) and
     (dbcombobox1.Items.Count > 0) and
     (dbcombobox1.Enabled) then
   begin
    DBComboBox1.SetFocus;
    SendMessage(DBComboBox1.Handle,WM_Char,word(Key),0);
   end;
 end;
end;

procedure TForm_flowpara.FormCreate(Sender: TObject);
begin
 OldGridWnd := DBGrid1.WindowProc ;
 DBGrid1.WindowProc := NewGridWnd;
end;

procedure TForm_flowpara.DBComboBox1KeyPress(Sender: TObject;
  var Key: Char);
begin
 if dmcon.ads494DATATYPE.Value='数字' then
 if not (key in ['0'..'9','.',#8,#13]) then  //判断是否输入数字
  abort;
end;

procedure TForm_flowpara.DBComboBox1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key=112 then dbcombobox1.DroppedDown:=true; //F1键出现下拉
if key=13 then dbgrid1.SetFocus;
end;

end.
